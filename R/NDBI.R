# Normalized Difference Built-up Index (NDBI)
#'
#' Computes the NDBI using NIR and the SWIR band.
#' @param nir Raster Layer of the Near-Infrared band.
#' @param swir Raster Layer of the Short-Wave Infrared band.
#' @return Raster Layer containing NDBI values.
#' @export
#' @examples
#' # ndbi_calc <- NDBI (swir_band, nir_band)
#' # plot(ndbi_calc)
NDBI <- function(swir, nir) {
  return((swir - nir) / (swir + nir))
}
