%%%parameter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global zeta omega;
A = 1;    %[cm]
omega = 2;    %[Hz]


%%%initial conditions%%%%%%%%%%%%%%%%%%%%%%
disp0 = 0;    %[cm]
vel0 = A*omega;    %[cm/s]

%%%caculation%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure()
x0 = [disp0,vel0];

%small damping
zeta = 0.2;  %[1]
[t,disp_sd]=ode45('gov_equ',[0.01,10],x0);
plot(t,disp_sd(:,1));hold on 

%critical damping
zeta = 1;  %[1]
[t,disp_cd]=ode45('gov_equ',[0.01,10],x0);
plot(t,disp_cd(:,1));hold on

%over damping
zeta = 2;  %[1]
[t,disp_od]=ode45('gov_equ',[0.01,10],x0);
plot(t,disp_od(:,1));hold on

legend('Small Damping','Critical Damping','Over Damping')
xlabel('Time')
ylabel('Amplitude ')
set(gca,'YLim',[-1 1])
print -f1 -r800 -djpeg NM_image

