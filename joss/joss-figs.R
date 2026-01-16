library(simulist)
library(tidyr)
library(dplyr)
library(incidence2)
library(ggplot2)
library(epicontacts)

# Plot onset, admission, death incidence ----------------------------------

# simulate a large outbreak to show outbreak dynamics for cases,
# hospitaliations and deaths

set.seed(1)
linelist <- sim_linelist(outbreak_size = c(1e3, 1e4))

linelist <- linelist %>%
  tidyr::pivot_wider(
    names_from = outcome,
    values_from = date_outcome
  )
linelist <- linelist %>%
  dplyr::rename(
    date_death = died,
    date_recovery = recovered
  )

weekly <- incidence2::incidence(
  linelist,
  date_index = c(
    onset = "date_onset",
    hospitalisation = "date_admission",
    death = "date_death"
  ),
  interval = "weekly",
  groups = "sex",
  complete_dates = TRUE
)

# formatting for plotting facetted variables
weekly$sex[weekly$sex == "f"] <- "Female"
weekly$sex[weekly$sex == "m"] <- "Male"
weekly$count_variable <- tools:::toTitleCase(weekly$count_variable)

inci_plot <- plot(weekly, angle = 45) +
  labs(x = "Date Index", y = "Count")

ggplot2::ggsave(
  filename = file.path("joss", "incidence.png"),
  plot = inci_plot
)


# Plot network and events -------------------------------------------------

# simulate a small outbreak with a high hospitalisation risk, reporting delay
# distribution and onset-to-recovery delay distribution

set.seed(2)
outbreak <- sim_outbreak(
  onset_to_recovery = function(x) stats::rlnorm(n = x, meanlog = 2, sdlog = 0.5),
  reporting_delay = function(x) stats::rlnorm(n = x, meanlog = 1, sdlog = 0.5),
  hosp_risk = 0.5,
  outbreak_size = c(10, 50)
)
epicontacts <- make_epicontacts(
  linelist = outbreak$linelist,
  contacts = outbreak$contacts,
  id = "case_name",
  from = "from",
  to = "to",
  directed = TRUE
)
plot(epicontacts)

# this <epicontacts> network plot is saved by manually exporting it to .png
# from the Rstudio IDE

linelist <- outbreak$linelist

tidy_linelist <- linelist %>%
  pivot_longer(
    cols = c("date_onset", "date_reporting", "date_admission", "date_outcome")
  ) %>%
  mutate(ordering_value = ifelse(name == "date_onset", value, NA)) %>% # nolint consecutive_mutate_linter
  mutate(case_name = reorder(case_name, ordering_value, min, na.rm = TRUE)) # nolint consecutive_mutate_linter

tidy_linelist$name <- factor(
  tidy_linelist$name,
  levels = c("date_onset", "date_reporting", "date_admission", "date_outcome")
)

ll_plot <- ggplot(data = tidy_linelist) +
  geom_line(
    mapping = aes(x = value, y = case_name),
    linewidth = 0.25
  ) +
  geom_point(
    mapping = aes(
      x = value,
      y = case_name,
      shape = name,
      col = name
    ),
    size = 2
  ) +
  scale_x_date(name = "Event date", date_breaks = "week") +
  scale_y_discrete(name = "Case name") +
  scale_color_brewer(
    palette = "Set1",
    name = "Event type",
    labels = c("Date Onset", "Date Reporting", "Date Admission", "Date Outcome")
  ) +
  scale_shape_manual(
    name = "Event type",
    labels = c(
      "Date Onset", "Date Reporting", "Date Admission", "Date Outcome"
    ),
    values = c(15, 16, 17, 18)
  ) +
  theme_bw() +
  theme(
    legend.position = "bottom",
    axis.text.x = element_text(
      angle = 45,
      vjust = 1,
      hjust = 1
    )
  )


ggplot2::ggsave(
  filename = file.path("joss", "multi-dot-plot.png"),
  plot = ll_plot
)
