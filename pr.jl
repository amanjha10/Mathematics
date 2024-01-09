function f(x)
    return x^3+x^2-1
end

function f_prime(x)
    return 3x^2+2x
end

function max_new_iteration(initial_guess,tolerance,max_iterations)
    x=initial_guess
    iteration=0

    while iteration<max_iterations

        x_new=x-f(x) / f_prime(x)

        if abs(x_new-x)
