#' Trim Raster
#'
#' This function applies both crop and mask operations on a raster object.
#'
#' @param r_stack RasterLayer or RasterStack object to be cropped and masked.
#' @param polygon RasterLayer object used for cropping and masking.
#' @return Raster object that has been cropped and masked.
#' @export
#' @importFrom raster crop
#' @importFrom raster mask
#' @examples
#' # trimmed_raster <- trimRaster(raster_object, mask_object)

trimRaster <- function(r_stack, polygon) {
  cropped <- raster::crop(r_stack, polygon) # Crop r_stack using polygon
  masked <- raster::mask(cropped, polygon)  # Mask the cropped raster with polygon
  return(masked)
}
