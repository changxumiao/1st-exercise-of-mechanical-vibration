%%%parameter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = 1;    %[cm]
omega = 2;    %[Hz]


%%%initial conditions%%%%%%%%%%%%%%%%%%%%%%
disp0 = 0;    %[cm]
vel0 = A*omega;    %[cm/s]

%%%damping ratio%%%%%%%%%%%%%%%%%%%%%%%%%%%
zeta_od = 2;    %[1]
zeta_sd = 0.2;  %[1]
zeta_cd = 1;    %[1]

%%%caculation%%%%%%%%%%%%%%%%%%%%%%%%%%%
t = 0:0.01:10;

%over damping
omega_star = omega*sqrt(zeta^2-1);
disp_od = exp(-zeta_od.*omega.*t).*(disp0.*cosh(omega_star).*t+(vel0+zeta_od.*omega.*disp0)/omega_star.*sinh(omega_star.*t));

%critical damping
disp_cd = exp(-omega.*t).*(disp0+(vel0+omega.*disp0).*t);

%small damping
omega_d = omega*sqrt(1-zeta_sd^2);
disp_sd = exp(-zeta_sd.*omega.*t).*(disp0.*cos(omega_d).*t+(vel0+zeta_sd.*omega.*disp0)/omega_d.*sin(omega_d.*t));
disp_sd_aid_plus = exp(-zeta_sd.*omega.*t);
disp_sd_aid_moins = -exp(-zeta_sd.*omega.*t);

figure()
plot(t,disp_sd,t,disp_cd,t,disp_od,t,disp_sd_aid_plus,'b--',t,disp_sd_aid_moins,'b--')
legend('Small Damping','Critical Damping','Over Damping')
xlabel('Time')
ylabel('Amplitude ')
set(gca,'YLim',[-1 1])
print -f1 -r800 -djpeg AM_image

