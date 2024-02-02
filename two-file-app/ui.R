# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) into tabPanel ----
  tabPanel(
    title = "About this page",
    
    # intro text fluidRow ------
    fluidRow(
      column(1),
      column(10, includeMarkdown("text/about.Rmd")),
      column(1)
    ), # END intro text fluidrow -----
    
    # add horizontal line
    hr(),
    
    includeMarkdown("text/footer.Rmd")
    
  ), # END (Page 1) intro tabPanel
  
  # (Page 2) data viz tabPanel ----
  tabPanel(title = "Explore the data",
           
           # tabsetPanel to contain tabs for data viz ------
           tabsetPanel(
             
             # trout tabPanel ------
             tabPanel(title = "Trout",
                      
                      # trout sidebarLayout -----
                      sidebarLayout(
                        
                        # trout siderbarPanel -----
                        sidebarPanel(
                          
                          # channel type pickerinput ------
                          pickerInput(inputId = "channel_type_input",
                                      label = "Select channel type(s)",
                                      choices = unique(clean_trout$channel_type),
                                      selected = c("cascade", "pool"),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE),
                          
                          # section checkboxGroupButtons ----
                          checkboxGroupButtons(inputId = "section_input",
                                               label = "Select a sampling section(s):",
                                               choices = c("clear cut forest", 
                                                           "old growth forest"),
                                               selected = c("clear cut forest", 
                                                            "old growth forest"),
                                               individual = FALSE,
                                               justified = TRUE,
                                               size = "sm",
                                               checkIcon = list(yes = icon("check"),
                                                                no = icon("xmark")))
                          
                        ), # END trout siderbarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          # trout scatterplot output ----
                          plotOutput(outputId = "trout_scatterplot_output")
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      # penguin tabPanel ------
                      tabPanel(title = "Penguin",
                               
                               # penguin sidebarLayout -----
                               sidebarLayout(
                                 
                                 # penguin siderbarPanel -----
                                 sidebarPanel(
                                   
                                   # penguin island pickerInput ----
                                   pickerInput(inputId = "island_input",
                                               label = "Select island type(s)",
                                               choices = unique(penguins$island),
                                               selected = unique(penguins$island),
                                               options = pickerOptions(actionsBox = TRUE),
                                               multiple = TRUE),
                                   
                                    # penguin histogram bin sliderInput -----
                                     sliderInput(inputId = "bin_num_input",
                                                  label = "Select amount of bins:",
                                                  value = 25,
                                                  min = 1,
                                                  max = 50),
                                   
                                 ), # END penguin siderbarPanel
                                 
                                 # penguin mainPanel ----
                                 mainPanel(
                                   
                                   # histogram output ------
                                   plotOutput(outputId = "penguin_hist_output")
                                   
                                 ) # END penguin mainPanel
                                 
                               ) # END penguin sidebarLayout
                               
                      ) # END penguin tabPanel
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbar page
