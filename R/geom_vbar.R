# library(ggpro)
## basic example code


#' @export
scale_x_vbar <- function(drop = F, wrap = 15, labels = function(x){stringr::str_wrap(x, wrap)}, ...){
  
    scale_x_discrete(drop = drop, 
                     labels = labels)
  
}    

#' @export
scale_y_vbar <- function(expand = expansion(c(0, .1)), yaxis_title = "", labels = function(x){ifelse(x == max(x, na.rm = T), paste0("\n", x, "\n", yaxis_title), x)}, ...){
 
  scale_y_continuous(expand = expand, labels = labels, ...)
   
}

#' @export
theme_vbar <- function(){
  
  theme(axis.line.x = element_blank(),
             panel.grid.major.x = element_blank(),
             panel.grid.minor.x = element_blank(),
             panel.grid.minor.y = element_blank(),
             panel.grid.major.y = element_line(),
             axis.title = element_blank(),
             axis.ticks = element_blank(),
             axis.line.x.bottom = element_line())
  
}

#' @export
geom_vbar <- function(yaxis = T, wrap = 15, yaxis_title = "", ...){
  
  list(geom_bar(...),
       theme_vbar(),
       scale_x_vbar(wrap = wrap),
       scale_y_vbar(yaxis_title = yaxis_title),
       NULL
       )
  
}

#' @export
geom_vbar_label <- function(...){
  
  
  statexpress::qlayer(geom = statexpress::qproto_update(GeomLabel,
                                                        aes(vjust = 0, linewidth = 0, fill = NA)),
                      stat = statexpress::qproto_update(StatCount, aes(label = after_stat(count)))
                                                )
  
}




