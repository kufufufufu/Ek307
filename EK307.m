load('TrussDesign1.mat');

%read in the column number and row number of C
[row,col] = size(C);

%Make the matrix of A with all zeros
A = zeros(2*row, col);
for c = 1:col
    a = 0;
    b = 0;
    for r = 1:row
        if C(r,c)== 1
            if a ~= 0
                b = r;
            else
                a = r;
            end
            if a~=0 && b ~= 0
                dis = sqrt((X(b)-X(a))^2+(Y(b)-Y(a))^2); %distance between joint
                A(a,c) = (X(b)-X(a))/dis;
                A(b,c) = (X(a)-X(b))/dis;
                A(row+a, c) = (Y(b)-Y(a))/dis;
                A(row+b,c) = (Y(a)-Y(b))/dis;
            end
        end
    end
end

S = [Sx;Sy];

A=[A, S];
            
T=inv(A)*L
