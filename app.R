#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
# Define UI for application that draws a histogram
ui <- fluidPage(

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

    output$nPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        # x    <- faithful[, 2]
        # bins <- seq(min(x), max(x), length.out = input$bins + 1)
        plot(input$N0*exp(input$r*1:input$time), type = "b",
             xlab = "time", ylab = "population size")
        # draw the histogram with the specified number of bins
        # hist(x, breaks = bins, col = 'darkgray', border = 'white',
        #      xlab = 'Waiting time to next eruption (in mins)',
        #      main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
