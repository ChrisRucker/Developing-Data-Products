library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
        
        # Application title
        titlePanel(div("2014-15 NBA REGULAR SEASON LEADERS", style = "color:royalblue")),
        
        # Sidebar with a slider input for the number of bins
        sidebarLayout(
                sidebarPanel(
                        sliderInput("bins",
                                    "PLAYERS:",
                                    min = 1,
                                    max = 277,
                                    value = 100),
                        
                        radioButtons("colour", "3. COLOR SCHEME:", choices = c("Knicks" = "royalblue" , "Nets" = "black", "Lakers" = "purple"), selected = "royalblue"),
                        ("*Source: http://stats.nba.com/leaders/")
                ),
                
                # Show a plot of the generated distribution
                mainPanel(
                        tabsetPanel(type = "tab",
                                    tabPanel("Plot", plotOutput("distPlot")),
                                    tabPanel("Description", textOutput("text1"),br(),textOutput("text2"),br(),textOutput("text3"),br(),textOutput("text4")),
                                    tabPanel("Data", tableOutput("data"))
    
#                         h4(div('Description of Use', style = "color:darkgray")),
#                         p(div('A histogram is a graphical representation of a quantitative variable. This histogram shows how points are distributed amongst two-hundred seventy-seven scoring leaders in the National Basketball Association for the 2014-15 regular season.', style = "color:darkgray")),
#                         p(div('Move the slider to change the number of players viewed in the histogram from one to two-hundred seventy-seven scoring leaders.', style = "color:darkgray")),
#                         p(div('Points on the x-axis of the histogram represent the number of points a player has scored. A point is scored when a player makes a basket. Frequency on the y-axis of the histogram represents the number of occurrences of a repeating event per unit time.', style = "color:darkgray")),
#                         p(div('The histogram is skewed to the right because the mass of the distribution is concentrated on the left of the figure also known as a positive skew. The measure of central tendency is a central or typical value for a probability distribution and is represented by the red line in the histogram also known as the mean. Note that the mean is for the entire dataset and does not move in this instance.', style = "color:darkgray")),
#                 h6(em(div('Source: http://stats.nba.com/leaders/'), style = "color:darkgray"))
                )
                        )
)
)
)
