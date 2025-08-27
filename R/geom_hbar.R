# library(ggpro)
## basic example code


#' @export
scale_y_hbar <- function(drop = F, wrap = 15, labels = function(x){stringr::str_wrap(x, wrap)}, ...){
  
    scale_y_discrete(drop = drop, 
                     labels = labels)
  
}    

#' @export
scale_x_hbar <- function(expand = expansion(c(0, .2)), xaxis_title = "", labels = function(x){ifelse(x == max(x, na.rm = T), paste0(x, "\n", xaxis_title), x)}, ...){
 
  scale_x_continuous(expand = expand, labels = labels, ...)
   
}

#' @export
theme_hbar <- function(){
  
  theme(axis.line.y = element_blank(),
             panel.grid.major.y = element_blank(),
             panel.grid.minor.y = element_blank(),
             panel.grid.minor.x = element_blank(),
             panel.grid.major.x = element_line(linewidth = .1),
             axis.title = element_blank(),
             axis.ticks = element_blank(),
             axis.line.y.left = element_line())
  
}

#' @export
geom_hbar <- function(xaxis = T, wrap = 15, xaxis_title = "", ...){
  
  list(geom_bar(...),
       theme_hbar(),
       scale_y_hbar(wrap = wrap),
       scale_x_hbar(xaxis_title = xaxis_title),
       NULL
       )
  
}




#' @export
geom_hbar_label <- function(...){
  
  
  statexpress::qlayer(geom = statexpress::qproto_update(GeomLabel,
                                                        aes(hjust = 0, linewidth = 0, fill = NA)),
                      stat = statexpress::qproto_update(StatCount, aes(label = after_stat(count))), ...
                                                )
  
}



