
library(shiny)
shinyUI(fluidPage(
  titlePanel("IRIS DATA ANALYSIS"),
   sidebarLayout(
        sidebarPanel(
                 h3("CHOOSE THE TYPE"),
                 h4("VIRGINICA / SETOSA / VERSICOLOR"),
                 textInput("box","Enter the type of SPECIES you chose",value=NULL)
                 
        ),
        mainPanel(
           h2("DISPLAY OF PARAMETERS FOR THE CHOOSEN TYPE"),
           h3("PARAMETERS"),
           h3("Sepal Length is:"),
           textOutput("out1"),
           h3("Petal Length is:"),
           textOutput("out2"),
           
        )
    )
))
