library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("GDP Ranking of Countries"),
  sidebarPanel(
      sliderInput('numCountries','Number of Countries to Show',value=40,min=10,max=250,step=10),
      sliderInput('minGDP','Minimum GDP (USD Billions)',value=50000,min=0,max=16000000,step=100000),
      width=4
  ),
  mainPanel(
    "This application will show countries ranked in descending order of GDP. You can select the minimum GDP and/or the number of countries you want to see.",
    h3('GDP Ranking'),
    h4("Number of Countries "),
    verbatimTextOutput("numCountries"),
    h4("You entered"),
    verbatimTextOutput("minGDP"),
    width=8,
    dataTableOutput("selectedCountries")
  )
))
