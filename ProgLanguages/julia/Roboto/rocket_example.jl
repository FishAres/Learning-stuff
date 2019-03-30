using NLOptControl, PrettyPlots

h_0 = 1 # initial height
v_0 = 1 # initial vel
m_0 = 1 # initial mass
g_0 = 1 # surface gravity

T_c = 3.5 # thrust
h_c = 500 # drag
v_c = 620 # drag
m_c = 0.6 # Fraction initial mass left at end

c = 0.5*sqrt(g_0*h_0) # Thrust-to-fuel mass
m_f = m_c*m_0 # Final mass
D_c = 0.5*v_c*m_0/g_0
T_max = T_c*g_0*m_0

n=define(numStates=3,numControls=1,X0=[h_0,v_0,m_0],XF=[NaN,NaN,m_f],
    XL=[h_0,v_0,m_f],XU=[NaN,NaN,m_0],CL=[0.0],CU=[T_max]);

states!(n,[:h,:v,:m],descriptions=["height (t)","velocity (t)","mass (t)"]);
controls!(n,[:T],descriptions=["thrust (t)"]);

Drag =:($D_c*v[j]^2 + exp(-$h_c*(h[j]-$h_0)/$h_0));
Grav = :($g_0 * ($h_0/h[j])^2);

Drag=:($D_c*v[j]^2*exp(-$h_c*(h[j]-$h_0)/$h_0));
Grav=:($g_0*($h_0/h[j])^2);
dx=Array{Expr}(3,);
dx[1]=:(v[j]);
dx[2]=:((T[j]-$Drag)/m[j]-$Grav)
dx[3]=:(-T[j]/$c);

dynamics!(n,dx)
configure!(n;(:finalTimeDV=>true));
@NLobjective(n.ocp.mdl,Max,n.r.ocp.x[end,1]);

optimize!(n);

allPlots(n)
