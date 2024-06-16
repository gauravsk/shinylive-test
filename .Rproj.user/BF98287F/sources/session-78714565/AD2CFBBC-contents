#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)
# Define UI for application that draws a histogram
ui <- page_sidebar(
  
  # Application title
  titlePanel("Population dynamics in continuous time"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("r",
                  "Intrinsic growth rate (r):",
                  min = -0.5,
                  max = 0.5,
                  value = 0.1),
      numericInput("N0",
                   "Initial population size (N0):",
                   min = 0,
                   max = 100,
                   value = 5),
      numericInput("K",
                   "Carrying capacity",
                   min = 0,
                   max = 1000,
                   value = 200),
      numericInput("time",
                   "Duration of population growth:",
                   min = 10,
                   max = 100,
                   value = 20)
      
      
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("nPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  bs_themer()
  output$nPlot <- renderPlot({
    plot((input$N0*input$K*exp(input$r*1:input$time))/
           ((input$K-input$N0) + input$N0*exp(input$r*1:input$time)), 
         type = "b",
         xlab = "time", ylab = "population size")
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
