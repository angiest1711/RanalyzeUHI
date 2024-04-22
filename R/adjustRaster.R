##' Adjust Raster Data
#'
#' This function takes raster data, applies a scale factor and offset correction,
#' and returns the corrected raster layer. It is possible to choose between "reflectance"
#' or "temperature" correction types.
#'
#' @param raster_data Raster data to correct. This can be a file path to a single raster file,
#'        a file path to multiple raster files (to be combined into a stack), a RasterLayer object,
#'        or a RasterStack object.
#' @param correction_type The type of correction to apply ("reflectance" or "temperature").
#'
#' @return A RasterLayer or RasterStack object with the correction applied.
#' @export
#' @examples
#' # corrected_raster_reflectance <- adjustRaster("path_to_raster.tif", "reflectance")
#' # plot(corrected_raster_reflectance)
#' # corrected_raster_temperature <- adjustRaster("path_to_raster.tif", "temperature")
#' # plot(corrected_raster_temperature)
#'
adjustRaster <- function(raster_data, correction_type) {
  # Ensure raster_data is loaded
  if (is.character(raster_data)) {
    raster_data <- raster::raster(raster_data)
  } else if (!inherits(raster_data, c("RasterLayer", "RasterStack", "RasterBrick"))) {
    stop("Input must be a file path, RasterLayer, RasterStack, or RasterBrick.")
  }

  # Apply correction
  correction <- switch(correction_type,
                       "reflectance" = raster::calc(raster_data, function(x) { (x * 0.0000275) - 0.2 }),
                       "temperature" = raster::calc(raster_data, function(x) { ((x * 0.00341802) + 149) - 273.15 }),
                       stop("Invalid correction type. Choose 'reflectance' or 'temperature'.")
  )

  return(correction)
}
