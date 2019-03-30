using Turing, Distributions
using Mamba: describe

y = [ 1.0, 1.0, 1.0, 1.0, 2.0, 2.0, 2.0, 3.0, 3.0, 3.0, 2.0, 2.0, 2.0, 1.0, 1.0 ];
N = length(y); K=3;

plot(y)

@model BayesHmm(y) = begin
    s = tzeros(Int, N)
    m = Vector{Real}(K)
    T = Vector{Vector{Real}}(K)
    for i = 1:K
        T[i] ~ Dirichlet(ones(K)/K)
        # m[i] ~ Normal(1, 0.1) # Defining m this way causes label-switching problem.
        m[i] ~ Normal(i, 0.01)
    end
    s[1] ~ Categorical(ones(Float64, K)/K)
    for i = 2:N
        s[i] ~ Categorical(vec(T[s[i-1]]))
        y[i] ~ Normal(m[s[i]], 0.01)
    end
    return(s, m)
end

g = Gibbs(500,
HMC(1, 0.2, 3, :m, :T, :s))

c = sample(BayesHmm(y), g);
