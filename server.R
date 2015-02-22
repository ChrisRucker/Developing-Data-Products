library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
        
        # Expression that generates a histogram. The expression is
        # wrapped in a call to renderPlot to indicate that:
        #
        #  1) It is "reactive" and therefore should be automatically
        #     re-executed when inputs change
        #  2) Its output type is a plot
        
    output$distPlot <- renderPlot({
        nba <- readRDS("nba.rds")
        PTS  <- nba[, 5]  
        bins <- seq(min(PTS), max(PTS), length.out = input$bins + 1)
    
    output$text1 <- renderText({paste(
            "A histogram is a graphical representation of a quantitative variable. This histogram shows how points are distributed amongst two-hundred seventy-seven scoring leaders in the National Basketball Association for the 2014-15 regular season." 
        )})
        output$text2 <- renderText({paste(
            "Move the slider to change the number of players viewed in the histogram from one to two-hundred seventy-seven scoring leaders."
        )})
        output$text3 <- renderText({paste(
            "Points on the x-axis of the histogram represent the number of points a player has scored. A point is scored when a player makes a basket. Frequency on the y-axis of the histogram represents the number of occurrences of a repeating event per unit time."
        )})
        output$text4 <- renderText({paste(
            "The histogram is skewed to the right because the mass of the distribution is concentrated on the left of the figure also known as a positive skew. The measure of central tendency is a central or typical value for a probability distribution and is represented by the red line in the histogram also known as the mean. Note that the mean is for the entire dataset and does not move in this instance."
        )})
        output$data <- renderTable({
            nba
        })
                
                # draw the histogram with the specified number of bins
                hist(PTS, breaks = bins, col =input$colour, border = 'white', ylab="FRQ",main="Official League Leaders", col.main="red")
                mnba <- mean(nba[, 5])
                abline(v = mnba, col = "red", lwd = 2)
                #legend("bottomleft", inset=c(0.2,-0.), legend=c("http://stats.nba.com/leaders/"), pch=c(1,3), title="Source")
                #legend("topright", c("Source: http://stats.nba.com/leaders/"))
        })
        
})

