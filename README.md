# parkinsons_disease_models
Sample MATLAB code for Parkinsons disease models used in Menon et al., 2023

**ODE model** <br>
pd_model_combined.m contains a MATLAB function representing the combined PD model (see main text of the paper for details).<br>
The function is intended for use with MATLAB ODE solvers. <br>
The function takes three arguments: current time, a vector of current values of state variables, and a function handle used to compute the value of one of the parameters as a function of time (k0, see model description in the paper for details) <br>
The values of other model parameters are set within the body of the function. The values used here correspond to Figures 2(A) and S1(C,D) <br>
<br>
**Simulations** <br>
PD_model_simulation.m contains code for simulating the combined PD model. <br>
The MATLAB function ode15s is used to numerically solve the ODE model. <br>
The example shown here corresponds to Figure S1(D). <br>
The above code can be modified (by setting appropriate parameter values and fk0) to generate all other simulation plots shown in the paper. <br>
<br>
**Bifurcation analysis** <br>
All bifurcation diagrams in the paper were generated using MATCONT version 6.6. (A. Dhooge, W. Govaerts, and Yu. A. Kuznetsov. 2003. MATCONT: A MATLAB package for numerical bifurcation analysis of ODEs. ACM Trans. Math. Softw. 29, 2 (June 2003), 141–164. https://doi.org/10.1145/779359.779362)
The model equations contained in pd_model_combined.m can be copied and pasted into the MATCONT GUI while defining a new system.

