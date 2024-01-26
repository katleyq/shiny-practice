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
                          
                          "trout inputs will live here"
                          
                        ), # END trout siderbarPanel
                        
                        # trout mainPanel ----
                        mainPanel(
                          
                          "trout outputs will live here"
                          
                        ) # END trout mainPanel
                        
                      ) # END trout sidebarLayout
                      
             ), # END trout tabPanel
             
             # penguin tabPanel ----
             tabPanel(title = "Penguins",
                      
                      "penguin viz goes here"
                      
             ) # END penguin tabPanel
             
           ) # END tabsetPanel
           
  ) # END (Page 2) data viz tabPanel
  
) # END navbar page
