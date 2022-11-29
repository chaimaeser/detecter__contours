function detecter_contours(A)
    A = imread(A);
    [n,m,p] = size(A);
    im2 = zeros(n,m,3);
    for i=2:n-1
        for j=2:m-1
            im2(i,j,1) = 255 - sqrt((A[i,j-1,1]-A[i,j+1,1])**2+(A[i-1,j,1]-A[i+1,j,1])**2);
            im2(i,j,2) = 255 - sqrt((A[i,j-1,2)-A[i,j+1,2])**2+(A[i-1,j,2]-A[i+1,j,2])**2);
            im2(i,j,3) = 255 - sqrt((A[i,j-1,3]-A[i,j+1,3])**2+(A[i-1,j,3]-A[i+1,j,3])**2);
        end
    end
figure;imshow(A);
im2=uint8(im2);
title('image originale')
figure;imshow(im2);
title('image grise')
imwrite(im2,'image.jpeg');