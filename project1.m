clc;
close all;
clear all;
A = imread('face1','jpg');
%L = fspecial('average',[25,25]);
B = fspecial('average',[5,5]);
imshow(A);title('original image');
size(A);
C = rgb2gray(A);
figure();imshow(C);title('grey scale image');
size(C);
A = im2double(C);
%size(A)
D = conv2(A,B,'same');
figure();imshow(D);title('convolved image');
Q = A-D;
figure();imshow(Q);title('edges before normalized');
S = size(Q);
for i = 1:S(1)
for j = 1:S(2)
    if Q(i,j)> 0.04
    Q(i,j) = 1;
    else
    Q(i,j) = 0;
    end
end
end
%V = fspecial('average',[1,1]);
%G = conv2(Q,V,'same');
figure();
size(Q);
imshow(Q);title('Final image');





    