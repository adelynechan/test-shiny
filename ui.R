# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  textInput("ensembl_id", "Ensembl ID", "ENSG00000141510", placeholder="ENSG..."), 
  verbatimTextOutput("selected_gene_ensembl_id"),

  mainPanel(
    plotOutput("logfcPlot")
  )
  
  # Application title
  #titlePanel("Hello Shiny!"),
  
  # Sidebar with a slider input for the number of bins
  #sidebarLayout(
    #sidebarPanel(
      #sliderInput("bins",
                  #"Number of bins:",
                  #min = 1,
                  #max = 50,
                  #value = 30)
    #),
    
    # Show a plot of the generated distribution
    #mainPanel(
      #plotOutput("logfcPlot")
    #)
  #)
))
