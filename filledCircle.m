function h = filledCircle(N,color,color2)
% filledCircle(100,'r','b');
R = 1;  
LINE_X= zeros(1,N);
LINE_Y = linspace(0,1,N);


%Draw left side
th = linspace( pi/2, -pi/2, N);
X = R*cos(th);
Y = R*sin(th);

LEFT_X=cat(2,X,LINE_X);
LEFT_Y=cat(2,Y,LINE_Y);

h = fill(LEFT_X,LEFT_Y,color);
hold on
axis([-1 1 -1 1]) 
axis square
%Draw right side
th = linspace( pi/2, -pi/2, N);
X = -R*cos(th);
Y = -R*sin(th);

RIGHT_X=cat(2,X,LINE_X);
RIGHT_Y=cat(2,Y,LINE_Y);

h= fill(RIGHT_X,RIGHT_Y,color2);
