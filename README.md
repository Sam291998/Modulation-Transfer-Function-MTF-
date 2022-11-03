# Modulation-Transfer-Function-MTF
Create different 1-D test patterns to calculate Modulation Transfer Function (MTF) using  1D point-spread function (PSF)

<pre>
Steps:-

a: Create 1D point-spread function (PSF)
  • using Gaussian function of array length = 13 and standard deviation = 3
  
b: Create 1D test pattern 
  • define the test patterns by 1D arrays of length = 64
  • line-pair/pixel = {1/32, 1/16, 1/8, 1/4, 1/2} (5 cases)
  • where "line-pair/pixel = 1/4" means each line-pair contains 4 pixels with 4/2 = 2 pixels of value 1 and 4/2 = 2 pixels of value 0
  
c: Calculate MTF (Michelson contrast)
  • calculate the central part of the convolution of each pattern and the PSF with the same length of the pattern
  • find the minimum and maximum values of the middle 32 pixels of the convolution result
  • calculate the modulation (Michelson contrast) by the minimum and maximum values for each case
  
</pre>
Result:

  1. The middle 32 pixels of all test patterns and all convolution results.
  
  ![con](https://user-images.githubusercontent.com/92868130/199793298-70bbeedd-9ca3-4469-b6fe-f7c5ec4adcaf.jpg)




  2. The modulation transfer function with the data points as crosses.
  
  ![mtf](https://user-images.githubusercontent.com/92868130/199793608-12bcd4d3-45ed-40d4-abfc-52e397accf68.jpg)

  
