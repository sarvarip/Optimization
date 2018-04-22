%Contour plot
close all
x = -2:0.01:2;
y = -1:0.01:3;
[X,Y] = meshgrid(x,y);
Z = 100*(Y-X.^2).^2+(1-X).^2;
figure;
contour(X,Y,Z,20,'ShowText', 'on');
figure;
surf(X,Y,Z);

%Z(295:305,295:305) -> indeed (1,1) is minimum, in fact value is zero