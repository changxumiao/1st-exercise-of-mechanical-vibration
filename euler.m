clear all
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
zeta_opt = [zeta_sd,zeta_cd,zeta_od];
%%%caculation%%%%%%%%%%%%%%%%%%%%%%%%%%%
t_end = 10;    %[s]
t_step = 0.01;    %[s]
t0 = 0;    %[s]
t = t0:t_step:t_end;


figure()
for j = 1:1:3
    zeta = zeta_opt(j);
    i = 2;
    x = zeros(2,t_end/t_step+1);
	x(1,1) = disp0;
	x(2,1) = vel0;
    t0 = 0;
    while  t0 < t_end-t_step
        t0 = t0 + t_step;
        x(1,i) = x(1,i-1) + x(2,i-1)*t_step;
        x(2,i) = x(2,i-1) + (-2*zeta*x(2,i-1) - omega^2*x(1,i-1))*t_step;
        i = i + 1;
    end
    plot(t,x(1,:));hold on;
end
legend('Small Damping','Critical Damping','Over Damping')
xlabel('Time')
ylabel('Amplitude ')
set(gca,'YLim',[-1 1])
print -f1 -r800 -djpeg EU_image
    
    
    
    
    