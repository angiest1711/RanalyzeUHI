#' Calculate Normalized Difference Vegetation Index (NDVI)
#'
#' Computes the NDVI from NIR and Red bands.
#' @param nir Raster Layer of the Near-Infrared band.
#' @param red Raster Layer of the Red band.
#' @return Raster Layer containing NDVI values.
#' @export
#' @examples
#' #ndvi_calc <- NDVI(nir_band, red_band)
#' #plot(ndvi_calc)
#'
NDVI <- function(nir, red) {
  (nir - red) / (nir + red)
}
