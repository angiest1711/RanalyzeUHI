#' Calculate External Area of City Buffer
#'
#' This function creates a buffer around a city geometry and then calculates
#' the external area by subtracting the original geometry from the buffer.
#'
#' @param city_geom A spatial object representing the city boundaries.
#' @param dist The distance for the buffer around the city, in the same units as the city geometry.
#' @return A spatial object representing the external area of the buffer.
#' @importFrom sf st_buffer st_difference
#' @examples
#'
#' #external_area <- calculate_external_buffer(city_geom, 2000)
#' #plot(st_geometry(external_area), col = "black", main = "External area of the buffer")
#' @export
rural_area_extraction <- function(city_geom, dist) {
  buffered <- st_buffer(city_geom, dist = dist)
  external_area <- st_difference(buffered, city_geom)
  return(external_area)
}
