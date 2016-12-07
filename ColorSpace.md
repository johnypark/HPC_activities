# Color Space Transformation 

Package "Colorspace Transformations" :https://www.mathworks.com/matlabcentral/fileexchange/28790-colorspace-transformations

After Downloading the file,
```matlab
mex colorspace.c
```
colorspace function is compiled as a MEX function. 

B = colorspace(S,A) converts the color representation of image A where S is a string specifying the conversion. 
S tells the source and destination color spaces, 
S = 'dest<-src', or alternatively, 
S = 'src->dest'. 
Supported color spaces are 

'RGB' = sRGB IEC 61966-2-1 

'YPbPr' = Luma (ITU-R BT.601) + Chroma 

'YCbCr' = Luma + Chroma 

'JPEG-YCbCr' = space used in JPEG 

'YUV' = NTSC PAL Y'UV Luma + Chroma 

'YIQ' = NTSC Y'IQ Luma + Chroma 

'YDbDr' = SECAM Luma + Chroma 

'HSV' or 'HSB' = Hue Saturation Value/Brightness 

'HSL' or 'HLS' = Hue Saturation Luminance 

'HSI' = Hue Saturation Intensity 

'XYZ' = CIE XYZ 

'Lab' = CIE L*a*b* (CIELAB) 

'Luv' = CIE L*u*v* (CIELUV) 

'LCH' = CIE L*C*H* (CIELCH) 

'CAT02 LMS' = CIE CAT02 LMS
