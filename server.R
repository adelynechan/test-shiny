shinyServer(function(input, output) {
  
  microarray_data <- read.table("data/microarray.txt")
  selected_gene_microarray_data <- microarray_data[microarray_data$ensembl_id == input,]
  
  output$main_plot <- renderPlot({
    
    ggplot(selected_genes_logfc, aes(x=sample, y=logfc, group=gene_symbol, color=gene_symbol)) 
    + geom_point() + theme(axis.text.x=element_text(angle=270))
    
  })
  
})



