%% Combined PD model, Fibrils and Proteasome - Sneppen2009(unwrapped) and Cloutier2012b

function f = pd_model_combined(t,x,fk0)
% fk0 is a function handle to a function specifying the value of the parameter k0 as a function
% of time (used to create step or pulse inputs, otherwise kept constant)


% Setting Parameter values (shown here for Figures 2(A) and S1(C,D))
m = 0.00042;
sig = 0.0042; %sigma
gam=0.0042; %gamma
nu=0.0042;
kP = 0.0042;
k1=35;
k2=35;
k3=0.0087;
k4=0.0042;
kagg=0.0042;
krem=0.0045;
dasyn=10;
k0=fk0(t); %Compute k0 as a function of time

% Setting model variables
F=x(1); % Concentration of larger aggregates
Cp=x(2); % Concentration of Proteasome-aggregate complex
P=x(3); % Concentration of proteasome components
asyn=x(4); % Concentration of misfolded alpha-syn
R=x(5); % Concentration of ROS

% Computing derivatives using model equations
f(1) = kagg*asyn-gam*F*P; %Time derivative of F                     
f(2) = gam*F*P - nu*Cp;   %Time derivative of Cp                       
f(3) = sig - kP*P - gam*F*P + nu*Cp;  %Time derivative of P          
f(4) = m + k3*R - kagg*asyn - k4*P*asyn - krem*asyn;%Time derivative of asyn  
f(5) = k1*(k0+dasyn*(asyn^4/(1+asyn^4))) - k2*R; %Time derivative of ROS

f = f(:);
end

