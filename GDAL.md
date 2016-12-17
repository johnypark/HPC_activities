##  GDAL usage in bash 

This document is to help using resources of University Florida hypergator cluster:

____________________________________________________________________________________________
Using GDAL software:
# 1. Loading software
```bash
$module load gcc
$module load gdal
```
# 2. See the available library:
```bash
$ ls $HPC_LIBGDAL_BIN
gdaladdo      gdal-config   gdaldem      gdal_grid  gdallocationinfo 
gdal_rasterize  gdalsrsinfo  gdaltransform   gdalwarp   ogr2ogr  ogrlineref 
testepsg
gdalbuildvrt  gdal_contour  gdalenhance  gdalinfo   gdalmanage       
gdalserver      gdaltindex   gdal_translate  nearblack  ogrinfo  ogrtindex
```
More information about the libraries @: http://www.gdal.org/pages.html
# 3. clipping raster file: 
http://www.gdal.org/gdalwarp.html

```bash
$ls
20150415_RGBNorm_Subset.tif			  BCI__Crown_Data_subset.prj
20150415_WaterShedBlueLineSeg_Subset.tif	  BCI__Crown_Data_subset.qpj
20150415_WaterShedBlueLineSeg_Subset.tif.aux.xml  BCI__Crown_Data_subset.shp
20150415_YCbCr_Subset.tif			  BCI__Crown_Data_subset.shx
20150415_YCbCr_Subset.tif.aux.xml		  RGBHaralikcTexturesCH2.tif
BCI__Crown_Data_subset.dbf			  RGBHaralikcTextures.tif
$gdalwarp -te 626140.100 1012125.000 626140.200 1012125.200 20150415_RGBNorm_Subset.tif clipped_output.tif

```


# 4. Example of using gdalinfo:

```bash
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
#5. Usage of Grep -E: Getting boundaries of the raster layer
   
   -E, --extended-regexp
          Interpret PATTERN as an extended regular expression (ERE, see below).  (-E is specified by POSIX.)

Matching Control
   -e PATTERN, --regexp=PATTERN
          Use PATTERN as the pattern.  This can be used to specify multiple search patterns, or to protect  a  pattern
          beginning with a hyphen (-).  (-e is specified by POSIX.)


```bash

$ ls
20150415_RGBNorm_Subset.tif			  BCI__Crown_Data_subset.qpj
20150415_WaterShedBlueLineSeg_Subset.tif	  BCI__Crown_Data_subset.shp
20150415_WaterShedBlueLineSeg_Subset.tif.aux.xml  BCI__Crown_Data_subset.shx
20150415_YCbCr_Subset.tif			  info.txt
20150415_YCbCr_Subset.tif.aux.xml		  RGBHaralikcTexturesCH2.tif
BCI__Crown_Data_subset.dbf			  RGBHaralikcTextures.tif
BCI__Crown_Data_subset.prj

$ gdalinfo 20150415_WaterShedBlueLineSeg_Subset.tif >>info.txt

$ ls
20150415_RGBNorm_Subset.tif			  BCI__Crown_Data_subset.qpj
20150415_WaterShedBlueLineSeg_Subset.tif	  BCI__Crown_Data_subset.shp
20150415_WaterShedBlueLineSeg_Subset.tif.aux.xml  BCI__Crown_Data_subset.shx
20150415_YCbCr_Subset.tif			  info.txt
20150415_YCbCr_Subset.tif.aux.xml		  RGBHaralikcTexturesCH2.tif
BCI__Crown_Data_subset.dbf			  RGBHaralikcTextures.tif
BCI__Crown_Data_subset.prj

$ grep -E -n 'Upper | Lower | Left | Right' info.txt
35:Upper Left  (  626140.021, 1012294.937) ( 79d51' 7.03"W,  9d 9'21.43"N)
36:Lower Left  (  626140.021, 1012125.047) ( 79d51' 7.05"W,  9d 9'15.89"N)
37:Upper Right (  626343.241, 1012294.937) ( 79d51' 0.37"W,  9d 9'21.40"N)
38:Lower Right (  626343.241, 1012125.047) ( 79d51' 0.39"W,  9d 9'15.87"N)
```

```bash

#!/bin/bash
##PBS -N fn
##PBS -o fn.out
##PBS -e fn.err
#PBS -j oe
#PBS -m abe
#PBS -l walltime=00:05:00
#PBS -l nodes=1:ppn=1:infiniband
#PBS -M g2njoy@ufl.edu
echo jobname: $PBS_JOBNAME

#Record the time and compute node the job ran on

DR_file="/home/g2njoy/BCI_analysis/EEE6512_Final_Project/data/"  # outpout dir
module load intel
module load netcdf
module load nco
module load otb
module load gcc
module load gdal

gdalwarp -te 626343.241 1012125.047 626140.021 1012294.937 20150415_PIF_7cm_ORTHO_R_clip.tif 2015_0415_clipped_7cm.tif

```

```bash

#!/bin/bash
##PBS -N fn
##PBS -o fn.out
##PBS -e fn.err
#PBS -j oe
#PBS -m abe
#PBS -l walltime=00:05:00
#PBS -l nodes=1:ppn=1:infiniband
#PBS -M g2njoy@ufl.edu
echo jobname: $PBS_JOBNAME

#Record the time and compute node the job ran on

DR_file="/home/g2njoy/BCI_analysis/EEE6512_Final_Project/data/"  # outpout dir
module load intel
module load netcdf
module load nco
module load otb
module load gcc
module load gdal
CHN=1
xradius=2;
yradius=2;

cd $DR_file
date; hostname; pwd
launch_otb otbcli_HaralickTextureExtraction -in bci0415_gray_16.tif -channel $CHN -parameters.xrad $xradius -parameters.yrad $yradius -texture simple -out 20150415_simple.tif

xradius=5;
yradius=5;

launch_otb otbcli_HaralickTextureExtraction -in bci0415_gray_16.tif -channel $CHN -parameters.xrad $xradius -parameters.yrad $yradius -texture advanced -out 20150415_advanced.tif
                      

```







