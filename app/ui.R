ui = fluidPage(
  
  titlePanel('This is a cool title', windowTitle = 'Cool title'),
  
  sidebarLayout(
    sidebarPanel(
      h1("Inputs"),
      sliderInput("priceInput", "Price", min = 0, max = 100,
                  value = c(25, 40), pre = "$"),
    
      radioButtons("typeInput", "Product type",
                 choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                 selected = "WINE"),
      uiOutput("countryOutput")
      ),
      
    mainPanel(
      plotOutput("coolplot"),
      br(), br(),
      tableOutput("results")
    )
  )
)
