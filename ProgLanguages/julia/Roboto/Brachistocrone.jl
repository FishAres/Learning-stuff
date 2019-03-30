using NLOptControl, PrettyPlots

# Boundary conditions
X0 = [0.0, 0.0, 0.0]
XF = [2., -2., NaN]

#= Dynamic Constraints - the system
x˙1(t) = x3(t)sin(u1(t))
x˙2(t) = −x3(t)cos(u1(t))
x˙3(t) = gcos(u1(t))
=#

#= Boundary conditions
x1(0)=0 x1(tf)=2
x2(0)=0 x2(tf)=−2
x3(0)=0 x3(tf)=free
=#
# This holds the entire problem
n = define(numStates=3, numControls=1, X0=X0, XF=XF);

states!(n, [:x, :y, :v], descriptions=["x(t)", "y(t)", "v(t)"]);
controls!(n, [:u], descriptions=["u(t)"]);

#= Dynamic Constraints - the system
x˙1(t) = x3(t)sin(u1(t))
x˙2(t) = −x3(t)cos(u1(t))
x˙3(t) = gcos(u1(t))
=#
dx = [:(v[j]*sin(u[j])), :(-v[j]*cos(u[j])), :(9.81*cos(u[j]))]
dynamics!(n, dx)

# Now we can configure the problem
# :Nck -> array that holds the number of points in each interval
configure!(n; (:Nck=>[100]), (:finalTimeDV=>true));

@NLobjective(n.ocp.mdl, Min, n.ocp.tf)
#=
n.ocp.mdl: object holding the JuMP model
Min: states it's a minimization problem
n.ocp.tf : the final time
=#

optimize!(n)

allPlots(n)
