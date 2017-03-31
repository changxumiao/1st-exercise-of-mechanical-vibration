clear all
lambd = 0:0.01:3;
zeta = [0.1,0.2,0.7,1.0];
for i = 1:size(zeta,2)
	beta(i,:) = 1./sqrt((1 - lambd.^2).^2+(2*zeta(i)*lambd).^2);
	phi(i,:) = atan((2*zeta(i)*lambd)./(1-lambd.^2));
    phi(i,find(phi(i,:)<0))=phi(i,find(phi(i,:)<0))+pi;
end
figure(1)
plot(lambd,beta);grid on;
xlabel('\lambda');
ylabel('\beta')
legend('\zeta = 0.1','\zeta = 0.2','\zeta = 0.7','\zeta = 1.0')
print -f -r800 -djpeg bata_image

figure(2)
plot(lambd,phi);grid on;
xlabel('\lambda');
ylabel('\phi')
legend('\zeta = 0.1','\zeta = 0.2','\zeta = 0.7','\zeta = 1.0','Location','northwest')
set(gca,'YTick',0:pi/4:pi)
set(gca,'YTickLabel',{'0','\pi/4','\pi/2','(3\pi)/4','\pi'})
print -f -r800 -djpeg phi_image