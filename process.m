function process( alpha , beta )
%PROCESS Summary of this function goes here
%   Detailed explanation goes here
I1=cosd(alpha)^2;
I2=cosd(alpha-beta)^2;
filledCircle(100,[I1 I1 0],[I2 I2 0]);
end