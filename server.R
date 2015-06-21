library(shiny)
library(dplyr)

gdp <- read.csv("GDP.csv",header=TRUE,stringsAsFactors=FALSE,colClasses="character")
str(gdp)
summary(gdp)
gdp$GDP <- gsub(",","",gdp$GDP)
gdp$GDP <- sapply(gdp$GDP,as.numeric,na.omit)
gdp$Rank <- sapply(gdp$Rank,as.numeric,na.omit)
gdp <- subset(gdp,select=-X)
max(gdp$GDP)
shinyServer(
  function(input,output){
    output$numCountries <- renderPrint({input$numCountries})
    output$minGDP <- renderPrint(paste0(format({input$minGDP},big.mark = ",")," Billion USD"))
    
    
    data <- reactive({
      selectedData <- gdp %>%
        filter(GDP >= input$minGDP) %>%
        top_n(input$numCountries,GDP)
      return(selectedData)
      
    })
    
    output$selectedCountries <- renderDataTable({
      countryData <- format(data(),big.mark=",")
      
      return(countryData)
    })
  }
  
  
)