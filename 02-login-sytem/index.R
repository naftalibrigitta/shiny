library(shiny)
library(shinyjs)
library(glue)


# load password
source('password.R') 



# ui (user interface)

ui <- navbarPage(
  title = 'Home', 
  id = 'tabs', 
  selected = 'Login to continue', 
  theme = 'main.css',              # defined in www/main.css
  useShinyjs(),                    # initiate javascript
  tab_login$ui,                    # ui for login page
  tab_01$ui,                       # ui for dashboard_01
  tab_02$ui                        # ui for dashboard_02
)

# server side

server <- function(input, output) {
  tab_login$server(input, output) # load login page server
  tab_01$server(input, output)    # load server of dashboard_01
  tab_02$server(input, output)    # load server of dashboard_02
}


shinyApp(ui = ui, server = server)

