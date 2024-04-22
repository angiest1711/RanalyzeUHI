# RanalyzeUHI - Urban Heat Island Analysis in R

The "RanalyzeUHI" package is designed to facilitate the analysis of Urban Heat Islands (UHI) using Landsat data. This package provides tools for adjusting, analyzing, and visualizing satellite data to study temperature disparities in urban versus rural areas.

## Data Requirements
The package is optimized for the use with the following Landsat products:
- **Landsat 8 Level-2**
- **Landsat 9 Level-2**

## Installation

To install the project, run the following commands:

```R
install.packages("devtools")
devtools::install_github("angiest1711/RanalyzeUHI")
```
### Using remotes
```R
install.packages("remotes")
remotes::install_github("angiest1711/RanalyzeUHI")
```
### Dependencies

Make sure you have installed the packages "raster" and "sf"
```R
install.packages(c("raster", "sf"))
```

## Functions

adjustRaster: Scales raster data to obtain surface reflectance or temperature in Celsius, essential for accurate UHI analysis. This function takes a raster object and a band specification as inputs.

indexplot: Creates a scatter plot with a smoothed line to visualize the relationship between Land Surface Temperature (LST) and other indices like NDVI or NDBI. This visualization helps in understanding the correlation between urban structures and vegetation.

NDBI: Calculates the Normalized Difference Built Index from satellite data. This index is used to delineate urbanized areas by highlighting regions with built-up structures.

NDVI: Calculates the Normalized Difference Vegetation Index, which is crucial for identifying live green vegetation. 

rural_area_extraction: Creates a buffer around specified urban areas (city geometries) and calculates the extent of rural land around these urban centers. 

trimRaster: Trims the raster data to focus on areas of interest.

## Examples

### indexplot

![image](https://github.com/angiest1711/RanalyzeUHI/assets/119541571/2766b072-134b-4005-ac4d-2242e2e867c1)


### adjustRaster and trimRaster

![image](https://github.com/angiest1711/RanalyzeUHI/assets/119541571/542270fb-371b-4d4f-b88f-b220ba6ea24d)
