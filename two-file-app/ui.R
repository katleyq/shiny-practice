# user interface ----
ui <- navbarPage(
  
  title = "LTER Animal Data Explorer",
  
  # (Page 1) into tabPanel ----
  tabPanel(
    title = "About this page",
    
    "background info goes here"
    
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
                                      selected = c("cascage", "pool"),
                                      options = pickerOptions(actionsBox = TRUE),
                                      multiple = TRUE)
                          
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
                                   
                                   "penguin inputs will live here"
                                   
                                 ), # END penguin siderbarPanel
                                 
                                 # penguin mainPanel ----
                                 mainPanel(
                                   
                                   "penguin outputs will live here"
                                   
                                 ) # END penguin mainPanel
                                 
                               ) # END penguin sidebarLayout
                               
                      ) # END penguin tabPanel
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbar page
