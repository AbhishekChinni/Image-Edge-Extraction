# Image-Edge-Extraction
Edge Extraction Techniques in MATLAB

To perform the edge extraction operation on various facial images extraction techniques.

Approach1:-
The approach adopted is only applicable for grayscale images. So firstly the image is taken and converted to grayscale image. Then the image is smoothed by convoluting it with an low-window average filter to reduce the noise and spread the edges. Then, the resulting image is subtracted from the original image. This results in the removal of all of the pixels except the edges as they were blurred when convoluted. Then, the resultant image is normalised by choosing an appropriate value as a threshold. This results in the highlighting of the edges prominently.
The resulting images after each step are in the repo.
  
Limitations:-

• Since we smooth the image with low window, the edges do not get detected if there is sufficient amount of noise spread out in the image in a small area.

• The Threshold value is not constant and keeps varying with the image. An average threshold value should be chosen such that it gives a reasonable edge detection.

Approach2:-
In this method we follow the steps described below.
Smoothing:-
In this method we use a gaussian filter and convolve it with the image to smooth it
Finding Gradients:-
The gradients are determined by convolving the smoothed image with the matrices Sx,Sy giving rise to Gx,Gy respectively.
      Sx = [1,0,-1;2,0,-2;1,0,-1];
      Sy = [1,2,1;0,0,0;-1,-2,-1];
      
The intensity gradient G is determined as |G|=|Gx|+|Gy|. It gives us a measure of the intensity of the pixel.Then, the angles for the slopes at each pixel are calculated.

Non-Maximum supression:-

The angles are then rounded to the four values 0,45,90,135 corresponding to horizontal ,vertical,two diagonal edges respectively

• If the rounded gradient angle is zero degrees (i.e. the edge is in the north- south direction) the point will be considered to be on the edge if its gradient magnitude is greater than the magnitudes at pixels in the north and south directions.

• If the rounded gradient angle is 90 degrees (i.e. the edge is in the east-west direction) the point will be considered to be on the edge if its gradient magnitude is greater than the magnitudes at pixels in the west and east directions

• If the rounded gradient angle is 135 degrees (i.e. the edge is in the north east- south west direction) the point will be considered to be on the edge if its
gradient magnitude is greater than the magnitudes at pixels in the north east and south west directions

• If the rounded gradient angle is 45 degrees (i.e. the edge is in the north west- south east direction)the point will be considered to be on the edge if its
gradient magnitude is greater than the magnitudes at pixels in the north west and south east directions

Thresholding:-

Then a threshold value is chosen such that if the intensity at that pixel is less than that threshold value it is ignored. This helps in further reducing the noise.
The images obtained after each step in this method are displayed below.

  Limitations:-
• Also due to the gaussian smoothing: the location of the edges might be off, depending on the size of the gaussian filter.
• An average threshold value is chosen and may be needed to change when dealing with a variety of images.
