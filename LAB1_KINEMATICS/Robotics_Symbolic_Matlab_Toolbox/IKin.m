function [q] = IKin(R, p)
% IKin Calculations for DaVinci Robot
% q = [qx qy qz]

ii = [1 ; 0 ; 0];
jj = [0 ; 1 ; 0];
kk = [0 ; 0 ; 1];
a5 = .010;
a6 = .020;

x6 = R * ii;
y6 = R * jj;
z6 = R * kk;
p5 = p - a6 * x6;
z5 = z6;

z4 = cross(p5, z5) / norm(cross(p5, z5));
x5 = cross(z5, z4);
p3 = p5 - a5 * x5;

theta1 = atan2(-jj.' * p3, -ii.' * p3);
R1 = [cos(theta1) 0 -sin(theta1) ; sin(theta1) 0 cos(theta1) ; 0 -1 0];
x1 = R1 * ii;
y1 = R1 * jj;
z1 = cross(x1, y1);


theta2 = -atan2(-x1.' * p3, -y1.' * p3);
d3 = norm(p3);
z3 = p3 / norm(p3);
x4 = cross(z4, z3);
theta5 = -atan2(z5.' * x4, x5.' * x4);
y5 = cross(z5, x5);



theta6 = atan2(y5.' * x6, x5.' * x6);
R3 = [cos(theta1)*cos(theta2) , -sin(theta1) , cos(theta1)*sin(theta2) ; 
    sin(theta1) * cos(theta2) , cos(theta1) , sin(theta1) * sin(theta2) ; 
    -sin(theta2) , 0 , cos(theta2)];
x3 = R3 * ii;
y3 = R3 * jj;
theta4 = atan2(y3.' * x4, x3.' * x4);

q = [theta1 theta2 d3 theta4 theta5 theta6]

end