#' Index Plot: Smooth Scatter Plot for LST and Indices
#'
#' Creates a scatter plot with a smoothed line for LST values against another index like NDVI or NDBI.
#'
#' @param lst Raster Layer of LST values.
#' @param index Raster Layer of index values (NDVI, NDBI, etc.).
#' @param index_name Character string with the name of the index ("NDVI", "NDBI", etc.) for labeling.
#' @param main Title for the plot, automatically generated if NULL.
#' @param col_alpha Transparency level for the plot points.
#' @param cex_lab Magnification for x and y labels relative to the current setting of cex.
#' @param cex_main Magnification for the main title relative to the current setting of cex.
#' @param cex_axis Magnification for axis text relative to the current setting of cex.
#' @importFrom raster values
#' @importFrom graphics lines
#' @importFrom scales alpha
#' @importFrom stats scatter.smooth
#' @return A Plot
#' @export
#' @examples
#'
#'   #indexplot(lst_raster, ndvi_raster, "NDVI")
#'
indexplot <- function(lst, index, index_name, main = NULL, col_alpha = 0.15,
                      cex_lab = 1.2, cex_main = 1.2, cex_axis = 1.2) {
  # Validate input types
  if (!inherits(lst, "RasterLayer") || !inherits(index, "RasterLayer")) {
    stop("Both lst and index must be RasterLayer objects.")
  }

  # Extract raster values
  lst_values <- raster::values(lst)
  index_values <- raster::values(index)

  # Remove NA values to avoid issues in plotting
  valid_data <- !is.na(lst_values) & !is.na(index_values)
  lst_values <- lst_values[valid_data]
  index_values <- index_values[valid_data]

  # Set default main title if not provided
  if (is.null(main)) {
    main <- paste("LST ~", index_name)
  }

  # Set dynamic x-axis limits based on index data
  x_limits <- range(index_values, na.rm = TRUE)

  # Create scatter plot with smoothed line
  scatter.smooth(x = index_values, y = lst_values,
                 xlim = x_limits, ylab = "LST  (\u00B0C)", xlab = index_name,
                 main = main, col = scales::alpha("grey23", col_alpha),
                 cex.lab = cex_lab, cex.main = cex_main, cex.axis = cex_axis)
}
