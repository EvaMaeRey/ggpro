#' @export
scale_color_logical <- function(...){
  scale_color_manual(values = c(scales::col_mix(theme_get()$geom@ink, 
                                              theme_get()$geom@paper, .6)
                                              , scales::col_mix(theme_get()$geom@accent, 
                                              theme_get()$geom@paper, .1)), guide = F)}

#' @export
scale_fill_logical <- function(...){
  scale_fill_manual(values = c(scales::col_mix(theme_get()$geom@ink, 
                                              theme_get()$geom@paper, .7)
                                              , scales::col_mix(theme_get()$geom@accent, 
                                              theme_get()$geom@paper, .3)), guide = F)
                    }
