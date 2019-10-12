using NewtonsMethod
using Test

@testset "NewtonsMethod.jl" begin
    # Write your own tests here.
    @test newtonroot(x -> x^2 , 1.0; tolerance = 1E-7, maxiter = 1) == nothing

    # several @test for the root of a known function
    @test newtonroot(x -> x^2 , x -> 2*x; tolerance = 1E-7, maxiter =1000) ≈≈ 5.960464477539063e-8
    @test newtonroot(x->x^3 , x->3*x^2, tolerance = 1E-7, maxiter =100) ≈≈ 1.3565659025724944e-7

    #tests of those roots using the automatic differentiation version of the function
    @test newtonroot(x -> x^2 , 1.0; tolerance = 1E-7, maxiter =1000) ≈≈ 5.960464477539063e-8
    @test newtonroot(x -> x^3 , 2.0, tolerance = 1E-7, maxiter =100) ≈≈ 1.808754536763326e-7

    #test of non-convergence for a function without a root (e.g. f(x)=2+x2 )
    @test newtonroot(x-> 2+x^2 , 1.0; tolerance = 1E-7, maxiter =1000) ≈≈ 5.960464477539063e-8

    #test to ensure that the maxiter is working (e.g. what happens if you call maxiter = 5
    @test newtonroot(x -> x^2 , 1.0; tolerance = 1E-7, maxiter = 5) == nothing

    #test to ensure that tol is working
    @test newtonroot(x -> x^2 , 1.0; tolerance = 1E-2, maxiter = 5) == nothing
end
