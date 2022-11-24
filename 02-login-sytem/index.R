library(shiny)
library(shinyjs)
library(glue)


# load global parameters (DB connections, login credentials, etc)
source('password.R') 
# load ui/server from each tab
source('./00_tab_login/tab.R') 
source('./01_tab_dash1/tab.R')
source('./02_tab_dash2/tab.R')

app.title <- 'Portal'

# ui (user interface)

ui <- navbarPage(
  title = app.title, 
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
