
library(shiny)
shinyServer(function(input, output) {
if(input$box=="VIRGINICA"){
    output$out1<-renderText("6.0")
}
    else if(input$box=="VERSICOLOR"){
        output$out1<-renderText("7.0")
    }
    else{
        output$out1<-renderText("5.0")
    }
if(input$box=="VIRGINICA"){
        output$out1<-renderText("6.5")
    }
    else if(input$box=="VERSICOLOR"){
        output$out1<-renderText("4.5")
    }
    else{
        output$out1<-renderText("1.5")
    }    
})
