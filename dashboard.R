install.packages('flexdashboard')
install.packages("plotly")
install.packages("dygraphs")
install.packages("colourpicker")
#file-->new file-->R markdown-->template-->flex
#To see this output we need to "Knit" the file by either clicking on the 
#Knit icon near the top of our file or pressing Ctrl+Shift+K.

#We could have a one-page dashboard but that would mean cramming a lot of 
#information in a small space. Flexdashboard gives us an option for having 
#multiple pages on our dashboard by demarcating sections in the code using the === header

#Now within a page, the layout orientation is based on rows or columns (or both). 
#A new row or column can be added using the ---header or ##.

#In R markdown working code needs to be encapsulated by the delimiters ```r{} and ``` 
#also called the code chunk delimiters. The way R markdown works is it will embed the 
#results at the end of the code chunk onto the HTML dashboard output.

#The renderPlotly() function renders anything that the plotly_build() function 
#understands, including plot_ly() , ggplotly() , and ggplot2 objects