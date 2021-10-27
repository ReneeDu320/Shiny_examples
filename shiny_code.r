dataset = read.csv(file = '/Users/karen/Desktop/us2021census.csv', header = TRUE)
# Define a server for the Shiny app
server <- function(input, output) {
  output$table <- dataset %>%
    `colnames<-`(., gsub("\\.", "_", tolower(colnames(.)))) %>%
    DT::renderDataTable(.,
                        options = list(
                          pageLength = 5, # show top 5 rows
                          initComplete = I("function(settings, json) {alert('Done.');}")
                        ), server = F
    )
}

ui <- fluidPage(

  titlePanel("US 2020 Census Data for all cities"),
  fluidRow(
    column(
      12,
      DT::dataTableOutput("table")
    )
  )
)
shinyApp(ui = ui, server = server)
