function dx = gov_equ(t,x)
global zeta omega
dx(1,:) = x(2);
dx(2,:) = -2*zeta*omega*x(2)-omega^2*x(1);
end