%% Simulation of the combined PD pathogenesis model

clc   %Clear command window
clear %Clear workspace

%Set tolerances for ODE solver
options = odeset( 'AbsTol', 1e-8,'RelTol',1e-8);
%Set time interval for simulation
trange=[0:1:1.8e5];

%Set initial conditions 
initial_conditions = [0.0182    0.1817    9.9840    0.1832    1.0112];
%Initial conditions need to be set specifically for each scenario to ensure
%that the system starts in a non-diseased steady state

%Define a function specifying parameter k0 as a function of time
%Example shown for step inpu in Figure S1(D)
tz = 0.9e5;  %Time at which step input switches on
fk0 = @(t) 0.2*(t<tz) + 4*(t>=tz); %fk0 is a function of t

%Use ode15s to generate numerical solution to ODE model, with specified
%initial conditions
[t,fval] = ode15s(@(t,v) pd_model_combined(t,v,fk0),trange, initial_conditions, options);

% Extract variables for plotting trajectories
F = fval(:,1);% Concentration of larger aggregates
C = fval(:,2);% Concentration of Proteasome-aggregate complex
P = fval(:,3);% Concentration of proteasome components
aSYN = fval(:,4);% Concentration of misfolded alpha-syn
ROS = fval(:,5);% Concentration of ROS

% Plot evolution of misfolded aSYN concentration over time
figure
plot(t,aSYN,'LineWidth',2)
box on
pbaspect([4 1 1])
xlim([0 t(end)])
ylim([0 max(aSYN)*1.1])
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 16;

% Plot evolution of Proteasomal components concentration over time
figure
plot(t,P,'LineWidth',2)
box on
pbaspect([4 1 1])
xlim([0 t(end)])
ylim([0 max(P)*1.1])
ax = gca;
ax.LineWidth = 2;
ax.FontSize = 16;

