# Define the function for which you want to find the root
function f(x)
    return exp(x) - 2
end

# Define the derivative of the function
function df(x)
    return exp(x)
end

# Newton-Raphson method to find the root of the function
function newton_raphson(initial_guess, tolerance, max_iterations)
    x = initial_guess
    iteration = 0
    
    while abs(f(x)) > tolerance && iteration < max_iterations
        x -= f(x) / df(x)
        iteration += 1
    end
    
    if abs(f(x)) <= tolerance
        println("Root found at x = $x after $iteration iterations.")
        return x
    else
        println("Root not found within the specified tolerance after $max_iterations iterations.")
        return nothing
    end
end

# Call the Newton-Raphson method with an initial guess, tolerance, and maximum iterations
root = newton_raphson(1.0, 1e-6, 100)

# Print the result
if root !== nothing
    println("Approximate root: $root")
else
    println("Newton-Raphson method did not converge.")
end
