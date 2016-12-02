# UFRC_hpc

This document is to help using resources of University Florida hypergator cluster:

____________________________________________________________________________________________
Using GDAL software:
1. Loading software
```bash
$module load gcc
$module load gdal
```
2. See the available library:
```bash
$ ls $HPC_LIBGDAL_BIN
gdaladdo      gdal-config   gdaldem      gdal_grid  gdallocationinfo 
gdal_rasterize  gdalsrsinfo  gdaltransform   gdalwarp   ogr2ogr  ogrlineref 
testepsg
gdalbuildvrt  gdal_contour  gdalenhance  gdalinfo   gdalmanage       
gdalserver      gdaltindex   gdal_translate  nearblack  ogrinfo  ogrtindex
```

3. Example of using gdalinfo:

```
$gdalinfo clipped_output.tif 
Driver: GTiff/GeoTIFF
Files: clipped_output.tif
Size is 1, 3
Coordinate System is:
PROJCS["WGS 84 / UTM zone 17N",
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.257223563,
                AUTHORITY["EPSG","7030"]],
            AUTHORITY["EPSG","6326"]],
        PRIMEM["Greenwich",0,
            AUTHORITY["EPSG","8901"]],
        UNIT["degree",0.0174532925199433,
            AUTHORITY["EPSG","9122"]],
        AUTHORITY["EPSG","4326"]],
    PROJECTION["Transverse_Mercator"],
    PARAMETER["latitude_of_origin",0],
    PARAMETER["central_meridian",-81],
    PARAMETER["scale_factor",0.9996],
    PARAMETER["false_easting",500000],
    PARAMETER["false_northing",0],
    UNIT["metre",1,
        AUTHORITY["EPSG","9001"]],
    AXIS["Easting",EAST],
    AXIS["Northing",NORTH],
    AUTHORITY["EPSG","32617"]]
Origin = (626140.099999999976717,1012125.199999999953434)
Pixel Size = (0.099999999976717,-0.066666666651145)
Metadata:
  AREA_OR_POINT=Area
Image Structure Metadata:
  INTERLEAVE=PIXEL
Corner Coordinates:
Upper Left  (  626140.100, 1012125.200) ( 79d51' 7.04"W,  9d 9'15.90"N)
Lower Left  (  626140.100, 1012125.000) ( 79d51' 7.04"W,  9d 9'15.89"N)
Upper Right (  626140.200, 1012125.200) ( 79d51' 7.04"W,  9d 9'15.90"N)
Lower Right (  626140.200, 1012125.000) ( 79d51' 7.04"W,  9d 9'15.89"N)
Center      (  626140.150, 1012125.100) ( 79d51' 7.04"W,  9d 9'15.90"N)
Band 1 Block=1x3 Type=Byte, ColorInterp=Red
  NoData Value=nan
Band 2 Block=1x3 Type=Byte, ColorInterp=Green
  NoData Value=nan
Band 3 Block=1x3 Type=Byte, ColorInterp=Blue
  NoData Value=nan
```







