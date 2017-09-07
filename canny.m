clc;
clear all;
close all;
A = imread('face2','jpg');
B = fspecial('gaussian',[5,5],1.4);
A = rgb2gray(A);
figure();imshow(A);title('grayscale image');
A = im2double(A);
C = conv2(A,B,'same');
%   C = A-C;
figure();imshow(C);title('convolved with gaussian filter');
S1 = [1,0,-1;2,0,-2;1,0,-1];
S2 = [1,2,1;0,0,0;-1,-2,-1];
%[S1 S2] = gradient(B);
G1 = conv2(C,S1,'same');
figure();imshow(G1);title('gradient G(x)');
G2 = conv2(C,S2,'same');
figure();imshow(G2);title('gradient G(y)');
G = abs(G1)+abs(G2);
figure();imshow(G);title('intensity gradient');
%G1 = G1.*G1;
%G2 = G2.*G2;
%G = sqrt(G1+G2);
T = atand(G1./G2);
D = size(T);
X = zeros(D(1),D(2));
for i = 1:D(1)
    for j = 1:D(2)
        if ((T(i,j) >= 0 && T(i,j) <= 25) || (T(i,j) >= -25 && T(i,j) <= 0))
            T(i,j) = 0;
        elseif ((T(i,j) > 25 && T(i,j) <= 75))
            T(i,j) = 45;
        elseif ((T(i,j) > 75 && T(i,j) < 90) || (T(i,j) >= -90 && T(i,j) <= -75))
            T(i,j) = 90;
        elseif ((T(i,j) > -75 && T(i,j) < -25))
            T(i,j)=135;
        end
    end
end

for i = 1:D(1)
    for j = 1:D(2)
        if (G(i,j) < 0.15)
            continue;
        end
        if (T(i,j) == 0)
            if(j-1 >0 && j+1 < D(2) && G(i,j-1) < G(i,j) && G(i,j+1) < G(i,j))
                X(i,j) = 1;
            end
        elseif (T(i,j) == 45)
            if ( i-1 > 0 && j-1 > 0 &&  j+1 < D(2) && i+1 < D(1) && G(i+1,j+1) < G(i,j) && G(i-1,j-1) < G(i,j))
                X(i,j) = 1;
            end
        elseif (T(i,j) == 90)
            if( i-1 >0 && i+1 < D(1) && G(i-1,j) < G(i,j) && G(i+1,j) < G(i,j))
                X(i,j) = 1;
            end
        elseif (T(i,j) == 135)
             if (i-1 > 0 && j-1 > 0 && i+1 < D(1) && j+1 <D(2) && G(i-1,j+1) < G(i,j) && G(i+1,j-1) < G(i,j))
                X(i,j) = 1;
             end
        end
    end
end

figure();imshow(X);title('Final image with thresholding');


            
            
        
                
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
