I_p = 0.001*40; %A
sI_p = 0.001*1;
B = 0.0001*3.99; %T
sB = 0.0001*0.01;

V_res1 = 0.001*1.6; %V
V_res2 = 0.001*2.8;
sV_res = 0.001*0.1;

error('geen theta_0 gemeten!')
theta_0 = 26; %�C
stheta_0 = 1;

theta = [130:-10:30];
stheta = ones(1,length(theta));
U_H = 0.001*[-3.2 0.0 7.8 22.8 43.6 61.0 72.7 78.9 81.6 82.3 82.6];
sU_H = 0.001*0.1*ones(1,length(U_H));