clc
clear 
close all

% Define the constants

cp_air = 1000; %J/kg*K
cp_gas = 1148; %J/kg*K
k_air = 1.4;
k_gas = 1.333;
R_air = cp_air*(1-1/k_air); % J/kg*K
R_gas = cp_gas*(1-1/k_gas); % J/kg*K
% R_air = 287; % J/kg*K
% R_gas = 287; % J/kg*K

% Define the given variables in the question

n_poly = 0.9;
bpr = 4;
fpr = 2.2;
opr = 18;
dp_comp = 0.06;
eff_comb = 1;
T_turb = 1200; %K
eff_mech = 0.98;
m = 1;

% n_poly = 0.9;
% bpr = 5;
% fpr = 1.65;
% opr = 25;
% dp_comp = 150; %kPa
% eff_comb = 1;
% T_turb = 1550; %K
% eff_mech = 0.99;
% m = 1;

% Define the cruise condition and the ambient condition

M_cruise = 0.7;
pa = 20; %kPa
Ta = 220; %K

% M_cruise = 0;
% pa = 100; %kPa
% Ta = 288; %K

% Calculate the (n-1)/n values for polytropic compression and expansion

poly_comp = (k_air-1)/(k_air*n_poly);
poly_exp = (k_gas-1)*n_poly/(k_gas);

% Calculate the mass ratios
mc = bpr/(bpr+1);
mh = 1-mc;

% Calculate the speed of sound

a = sqrt(R_air*k_air*Ta);
Ca = M_cruise*a;


% Assume intake efficiency of 0.95

eff_in = 1;

% Calculate the state 1 temperature and pressure
T01 = Ta+(a*M_cruise)^2/(2*cp_air);
p01 = pa*(1+eff_in*(a*M_cruise)^2/(2*cp_air*Ta))^(k_air/(k_air-1));

% Calculate the state 2 temperature and pressure
T02 = T01*(fpr)^poly_comp;
p02 = p01*fpr;

% Calculate the state 3 temperature and pressure
T03 = T02*(opr/fpr)^poly_comp;
p03 = opr*p01;

% Calculate the state 4 temperature and pressure
T04 = T_turb;
p04 = p03*(1-dp_comp);

% Calculate the state 5 temperature and pressure
T05 = T04 - (cp_air*(T03-T02))/(eff_mech*cp_gas);
p05 = p04*(T05/T04)^(1/poly_exp);

% Calculate the state 6 temperature and pressure
T06 = T05 - (bpr+1)*cp_air*(T02-T01)/(eff_mech*cp_gas);
p06 = p05*(T06/T05)^(1/poly_exp);

% Asuume that the mach number at state 6 is 0.5
M6 = 0.5;

% Calculate the pressure and temperature at state 6 using the standard relations
p6 = p06*(1/(1+(k_gas-1)/2*M6^2))^(k_gas/(k_gas-1));
T6 = T06/(1+(((k_gas-1)*M6^2)/2));
rho6 = p6/(R_gas*T6)*10^3;
C6 = M6*sqrt(k_gas*R_gas*T6);
A6 = mh/(C6*rho6);


% Calculate the pressure and temperature at state 2 using the standard relations
p2=p6;

p2_p02 = p2/p02;

% Define the function for which we want to find the root
f = @(M2) (1 + 0.5*(k_air-1)*M2^2)^(-k_air/(k_air-1)) - p2_p02;

% Initial guess for Mach number
M0 = 0.5;

% Use fzero to find the root of the function
M2 = fzero(f, M0);
T2 = T02/(1+(((k_air-1)*M2^2)/2));
rho2 = p2/(R_air*T2)*10^3;
C2 = M2*sqrt(k_air*R_air*T2);
A2 = mc/(C2*rho2);


% Calculate the mixture properties
cp_m = (mc*cp_air+mh*cp_gas)/(mc+mh);
R_m = (mc*R_air+mh*R_gas)/(mc+mh);
k_m = 1/(1-R_m/cp_m);

% Calculate T07
T0m = (mc*cp_air*T02+mh*cp_gas*T06)/(m*cp_m);

momentum_m = (mc*C2+p2*1000*A2)+(mh*C6+p6*1000*A6);
Am = A6+A2;

% Make an initial guess for M7
Mm_a = 0.1;
Mm_b = 1;

for i=1:100
    Mm = (Mm_a+Mm_b)/2;
    Tm = T0m/(1+(((k_m-1)*Mm^2)/2));
    Cm = Mm*sqrt(k_m*R_m*Tm);
    pm = m*R_m*Tm/(Cm*Am*1000);
    m_m_calc = m*Cm+Am*pm*1000;
    error = m_m_calc-momentum_m;
    tolerance = 1e-6;
    
    if m_m_calc < momentum_m  % Stop if the function value is close to zero
        Mm_b = Mm;
    elseif m_m_calc > momentum_m
        Mm_a = Mm;
    end
    
    if abs(error) < tolerance
        break
    end
end

p0m = pm/((1/(1+(k_m-1)/2*Mm^2))^(k_m/(k_m-1)));

% Calculate the nozzle pressure ratio
p0m_pa = p0m/pa;

% Calculate the critical pressure ratio
p0m_pc = 1/(1-(k_m-1)/((k_m+1)*eff_in))^(k_m/(k_m-1));

% Check if the nozzle is choking 

if p0m_pa > p0m_pc
    fprintf('The nozzle is choking.\n')
else
    fprintf('The nozzle is not choking.\n')
end

% Since the nozzle is choking, T7=Tc and p7=pc
T7 = (2/(k_m+1))*T0m;
p7 = p0m*(1/p0m_pc);
rho7 = p7/(R_m*T7)*10^3;
C7 = sqrt(k_m*R_m*T7);
A7 = m/(rho7*C7);

specific_thrust = C7-Ca+A7*(p7-pa)*1000/m
A2_A6 = A2/A6


