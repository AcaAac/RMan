function [B_max] = Worst_Inertia(B)

syms q1 q2 q5 real;
B_max = zeros(3,1);
q21_max = vpasolve(diff(simplify(subs(B(1,1), [q2, q5], [q2, 1])), q2));
B_max(1,1) = double(subs(B(1,1), [q2, q5], [q21_max, 1]));
B_max(2,1) = double(subs(B(2,2), q5, 1));
B_max(3,1) = B(3,3);

% Useless
% q51_max = jacobian(B(1,1), q5);
% q12_max = vpasolve(diff(simplify(subs(B(2,2), [q1, q5], [q1, 1])), q1));
% Useless
% q52_max = jacobian(B(2,2), q5);
% B(3,3)_max = 3
% q15_max = jacobian(B(3,3), q1);
% q25_max = jacobian(B(3,3), q2);

end
