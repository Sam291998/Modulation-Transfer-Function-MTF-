%Samson David Puthenpeedika

%1D point-spread function (PSF)
A=fspecial('gaussian',[1 13],3);

%1D test patterns
B=ones(1,64);
t32=testpattern(B,32);
t16=testpattern(B,16);
t8=testpattern(B,8);
t4=testpattern(B,4);
t2=testpattern(B,2);

% modulation transfer function (MTF)
CP32=conv(t32,A,"same");
mi32=min(CP32(17:48));
mx32=max(CP32(17:48));
M32=modulation(mi32,mx32);

CP16=conv(t16,A,"same");
mi16=min(CP16(17:48));
mx16=max(CP16(17:48));
M16=modulation(mi16,mx16);

CP8=conv(t8,A,"same");
mi8=min(CP8(17:48));
mx8=max(CP8(17:48));
M8=modulation(mi8,mx8);

CP4=conv(t4,A,"same");
mi4=min(CP4(17:48));
mx4=max(CP4(17:48));
M4=modulation(mi4,mx4);

CP2=conv(t2,A,"same");
mi2=min(CP2(17:48));
mx2=max(CP2(17:48));
M2=modulation(mi2,mx2);


M=[M32 M16 M8 M4 M2];
line_pair_pixel=[1/32 1/16 1/8 1/4 1/2];


% Display
figure("Name","Modulation Transfer Function (MTF)");
plot(line_pair_pixel,M);
xlabel("Line-Pair/Pixel");
ylabel(" Modulation (Michelson contrast) ");
title("Modulation Transfer Function (MTF)");
hold on
scatter(line_pair_pixel,M,"x");
hold off
legend("Modulation transfer function","Data points")


figure()
subplot(5,2,1)
imshow(t32(17:48));
ylim([0 1]);
title("Test pattern 1/32");

subplot(5,2,2)
imshow(CP32(17:48));
ylim([0 1]);
title("Convolution pattern 1/32");

subplot(5,2,3)
imshow(t16(17:48));
ylim([0 1]);
title("Test pattern 1/16");

subplot(5,2,4)
imshow(CP16(17:48));
ylim([0 1]);
title("Convolution pattern 1/16");

subplot(5,2,5)
imshow(t8(17:48));
ylim([0 1]);
title("Test pattern 1/8");

subplot(5,2,6)
imshow(CP8(17:48));
ylim([0 1]);
title("Convolution pattern 1/8");

subplot(5,2,7)
imshow(t4(17:48));
ylim([0 1]);
title("Test pattern 1/4 ");

subplot(5,2,8)
imshow(CP4(17:48));
ylim([0 1]);
title("Convolution pattern 1/4 ");

subplot(5,2,9)
imshow(t2(17:48));
ylim([0 1]);
title("Test pattern 1/2 ");

subplot(5,2,10)
imshow(CP2(17:48));
ylim([0 1]);
title("Convolution pattern 1/2 ");




% Function for 1D test patterns
function T=testpattern(B,n)
s = reshape(B, [], n);
s(:,(n/2)+1:n) = 0;
T = reshape(s', 1, []);
end

% Function for calculating the modulation (Michelson contrast)
function M=modulation(min,max)
M=(max-min)/(max+min);
end

