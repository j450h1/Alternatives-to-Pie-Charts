df <- data.frame(pcategory = c('Production','Facilities','Labor','Licenses','Taxes',
                           'Legal','Insurance'), pcost = c(24.8,20.98,17.48,
                                                           12.59,10.49,8.39,5.59))
library(ggvis)
library(dplyr)
library(scales)
#Sort from highest to lowest, levels are also reordered
df <- transform(df, pcategory=reorder(pcategory, -pcost) ) 
#Draw bar chart
df %>% ggvis(~pcategory,~pcost, fill = "blue") %>% layer_bars() %>%
  add_axis("x", title = "Project Category") %>%
  add_axis("y", title = "Project Cost") %>%
  add_axis("x", orient = "top", ticks = 0, title = "Project Cost Breakdown", #title
           properties = axis_props(
             axis = list(stroke = "white"),
             labels = list(fontSize = 0))) %>%
  hide_legend("fill") #Hide legends