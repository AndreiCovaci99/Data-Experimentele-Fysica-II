conductiviteit_intrinsiek
b=0.001;
h=0.010;
l=0.020;
sb=0.0001;
sh=0.0001;
sl=0.0001;

sigma=I_p./U_H*l/(h*b);
DI=sigma./I_p*sI_p;
DU=sigma./U_H.*sU_H;
Dl=sigma./l*sl;
Dh=sigma./h*sh;
Db=sigma./b*sb;
for n=1:length(sigma)
ssigma(n)=sqrt(DI(n)^2+DU(n)^2 +Dl(n)^2+Dh(n)^2+Db(n)^2);
end

T=theta+273.15;

y=log(-sigma)
sy=ssigma./-sigma

x=1./T
sx=stheta./(T).^2


sigma_in=sigma
ssigma_in=ssigma

figure(1)
plot(x,y,'*')
title('ln (\sigma) in functie van 1/T')
xlabel('1/T'),ylabel('ln (\sigma_intrinsiek)')
hold on
[a,sa,b,sb]=LinRegWillOf(x,y);

k=8.6173303*10^-5


Egap=-a*2*k
sEgap=sa*2*k





clear sigma ssigma n DI DU Dl Dh Db theta stheta T sT x sx y sy

conductiviteit_p

sigma=I_p./U_H*l/(h*b);
DI=sigma./I_p*sI_p;
DU=sigma./U_H.*sU_H;
Dl=sigma./l*sl;
Dh=sigma./h*sh;
Db=sigma./b*sb;
for n=1:length(sigma)
ssigma(n)=sqrt(DI(n)^2+DU(n)^2 +Dl(n)^2+Dh(n)^2+Db(n)^2);
end

T=theta+273.15;

y=log(-sigma)
sy=ssigma./-sigma

x=1./T
sx=stheta./(T).^2

figure(2)
plot(x,y,'*')
title('ln (\sigma) in functie van 1/T')
xlabel('1/T'),ylabel('ln (\sigma_intrinsiek)')

sigma_p=sigma
ssigma_p=ssigma


clear sigma ssigma n DI DU Dl Dh Db theta stheta T sT x sx y sy


