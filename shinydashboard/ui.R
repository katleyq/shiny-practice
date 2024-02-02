# dashboardHeader -----
header <- dashboardHeader(
  
  # title -----
  title = "Fish Creek Watershed Lake Monitoring",
  titleWidth = 400
  
) # END dashboardHeader()

# dashboardSidebar -----
sidebar <- dashboardSidebar(
  
  # sidebarMenu ----
  sidebarMenu(
    
    menuItem(text = "Welcome", tabName = "welcome", icon = icon("star")),
    menuItem(text = "Dashboard", tabName = "dashboard", icon = icon("gauge"))
    
  ) # END sidebarMenu
  
  
) # END dashboardSiderbar()

# dashboardBody -----
body <- dashboardBody(
  
  # tabItems ----
  tabItems(
    
    # welcome tabItem ----
    tabItem(tabName = "welcome",
            
            # left-hand column ----
            column(width = 6,
                   
                   # background info box ----
                   box(width = NULL,
                       
                       "background info here"
                       
                   ), # END background info box
                   
            ), # END left-hand column
            
            # right-hand column ----
            column(width = 6,
                   
                   # first fluidRow ----
                   fluidRow(
                     
                     # data source box ----
                     box(width = NULL,
                         
                         "data citation here"
                         
                     ) # END data source box
                     
                   ), # END first fluidRow
                   
                   # second fluidRow ----
                   fluidRow(
                     
                     # disclaimer box ----
                     box(width = NULL,
                         
                         "disclaimer here"
                         
                     ) # END disclaimer box
                     
                   ) # END second fluidRow
                   
            ) # END right-hand column
            
    ), # END welcome tabItem
    
    # dashboard tabItem ----
    tabItem(tabName = "dashboard",
            
            # fluidRow ----
            fluidRow(
              
              # input box ----
              box(width = 4,
                  
                  
                  title = tags$strong("Adjust lake parameter ranges:"),
                  
                  # sliderInputs ----
                  sliderInput(inputId = "elevation_slider_input", 
                              label = "Elevation (meters above SL):",
                              min = min(lake_data$Elevation), max = max(lake_data$Elevation),
                              value = c(min(lake_data$Elevation), max(lake_data$Elevation)))
                  
              ), # END input box
              
              # leaflet box ----
              box(width = 8, 
                  
                  "leafletOutput here"
                  
              ) # END leaflet box
              
            ) # END fluidRow
            
    ) # END dashboard tabItem
    
  ) # END tabItems
  
) # END dashboardBody()

# combine all in dashboardPage -----
dashboardPage(header, sidebar, body)