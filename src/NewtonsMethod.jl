module NewtonsMethod

using LinearAlgebra, ForwardDiff

function newtonroot(f, f_prime; x₀ = 1.0, tolerance = 1E-7, maxiter = 1000)
    x_old = x₀
    normdiff = Inf
    iter = 1

    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - f(x_old)/f_prime(x_old)
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end

    if normdiff > tolerance
        return nothing
    else
        return value = x_old
    end
end

function newtonroot(f, x₀::Float64; tolerance = 1E-7, maxiter = 1000)
    f_prime(x) = ForwardDiff.derivative(f, x)
    x_old = x₀
    normdiff = Inf
    iter = 1

    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - f(x_old)/f_prime(x_old)
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end

    if normdiff > tolerance
        return nothing
    else
        return value = x_old
    end
end


export newtonroot

end # module
