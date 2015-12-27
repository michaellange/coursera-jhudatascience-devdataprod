library(shiny)

shinyUI(
    navbarPage("Developing Data Products",
        tabPanel("BMI calculator",
            sidebarLayout(
                sidebarPanel(
                    numericInput("height",
                        label = "Body height in centimeter",
                        value = 180,
                        step = 1
                    ),
                    numericInput("weight",
                        label = "Body mass in kilograms",
                        value = 75,
                        step = 1
                    ),
                    submitButton('Calculate')
                ),
                mainPanel(
                    h4("Adapt the values on the left side and click 'Calculate' to see the results"),
                    hr(),
                    textOutput("heightText"),
                    textOutput("weightText"),
                    h5("The calculated BMI is"),
                    verbatimTextOutput("bmiValue"),
                    h5("The calculated BMI category is"),
                    verbatimTextOutput("bmiCategory")
                )
            )
        ),
        tabPanel("BMI wikipedia",
            h5("https://en.wikipedia.org/wiki/Body_mass_index")
        )
))
