# load packages ----
library(palmerpenguins)
library(tidyverse)
library(DT)

# filter penguins df for observations where body mass is >= 3000 & <= 4000 ----
body_mass_df <- penguins %>% 
  filter(body_mass_g %in% c(3000:4000))

# create scatterplot ----
ggplot(na.omit(body_mass_df), 
       aes(x = flipper_length_mm,
           y = bill_length_mm,
           color = species, shape = species )) +
  geom_point() +
  scale_color_manual(values = c("Adelie" = "darkorange", 
                                "Chinstrap" = "purple", 
                                "Gentoo" = "cyan4")) +
  scale_shape_manual(values = c("Adelie" = 19, 
                                "Chinstrap" = 17, 
                                "Gentoo" = 15)) +
  labs(x = "Flipper length (mm)",
       y = "Bill length (mm)",
       color = "Penguins species",
       shape = "Penguin species") +
  theme_minimal() +
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(color = "white")) 


# ui spot for data table
# body mass datatable input ----
checkboxGroupInput(inputId = "body_mass_input",
            label = "Select a range of body masses (grams):",
            min = 2700, max = 6300,
            value = c(3000, 4000)),

# body mass datatable output ----
dataTableOutput(DT::dataTableOutput(outputId = "bodyMass_datatable_output"))

  # filter for years  ----

  # render penguin datatable ----
output$bodyMass_datatable_output <- renderDataTable({

})

# sam's code:

years_df <- penguins %>% 
  filter(year %in% c(2007:2008))

DT::datatable(years_df)
