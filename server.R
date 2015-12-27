library(shiny)

calculate_BMI_value <- function(height, weight) {
    result <- weight / (height / 100) ^ 2
    return(result)
}

calculate_BMI_category <- function(height, weight) {
    value <- calculate_BMI_value(height, weight)
    if (value < 15) {
        return("Very severely underweight")
    } else if (value >= 15 & value < 16) {
        return("Severely underweight")
    } else if (value >= 16 & value < 18.5) {
        return("Underweight")
    } else if (value >= 18.5 & value < 25) {
        return("Normal (healthy weight)")
    } else if (value >= 25 & value < 30) {
        return("Overweight")
    } else if (value >= 30 & value < 35) {
        return("Obese Class I (Moderately obese)")
    } else if (value >= 35 & value < 40) {
        return("Obese Class II (Severely obese)")
    } else if (value >= 40) {
        return("Obese Class III (Very severely obese)")
    }
} 

shinyServer(
    function(input, output) {
        output$heightText <- renderText({paste("Body height in centimeter: ", input$height)})
        output$weightText <- renderText({paste("Body mass in kilograms: ", input$weight)})
        output$bmiValue <- renderPrint({calculate_BMI_value(input$height, input$weight)})
        output$bmiCategory <- renderPrint({calculate_BMI_category(input$height, input$weight)})
    }
)
