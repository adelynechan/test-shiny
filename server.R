library(ggplot2)

shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  microarray <- read.table("data/microarray.txt", header=TRUE, sep="\t")
  microarray$ensembl_id <- as.character(microarray$ensembl_id)

  selected_genes_expression <- reactive({
    selected_gene <- input$ensembl_id
    x <- microarray[microarray$ensembl_id == input$ensembl_id,]
    x$sample <- factor(x$sample, levels=c("0d", "2h", "4h", "8h", "12h", "1d", "32h", "2d", "3d", "4d", "5d", "6d", "7d", "8d"))
    
    return (x)
  })
  
  geneSymbol_ensemblID <- read.table("data/biomart_geneSymbol_ensemblID.txt", header=TRUE, sep=",")
  
  geneSymbol <- reactive({
    selected_gene_symbol <- as.character(geneSymbol_ensemblID$Gene.name[geneSymbol_ensemblID$Gene.stable.ID == input$ensembl_id])
    return (selected_gene_symbol)
  })
  
  plotLogFC <- reactive({
    ggplot(selected_genes_expression(), aes(x=sample, y=logFC, group=ilmn_id, colour=dataset)) + geom_point() + geom_line() + geom_hline(yintercept=0) + scale_colour_manual(values=c("blue", "red")) + ggtitle(geneSymbol())
  })
  
  output$logfcPlot <- renderPlot({
    #name <- paste0(input$genename, ".png")
    #ggsave(name, plotLogFC())
    plotLogFC()
  })

})

