# Define the function for which you want to find the root
function f(x)
    return x^3 - 2x^2 + 4x - 8
end

# Bisection method to find the root of the function
function bisection(a, b, tolerance, max_iterations)
    if f(a) * f(b) >= 0
        println("Bisection method cannot guarantee convergence with the given initial interval.")
        return nothing
    end
    
    for iteration in 1:max_iterations
        c = (a + b) / 2.0
        
        if abs(f(c)) < tolerance
            println("Root found at x = $c after $iteration iterations.")
            return c
        end
        
        if f(a) * f(c) < 0
            b = c
        else
            a = c
        end
    end
    
    println("Bisection method did not converge within the specified number of iterations.")
    return nothing
end

# Call the bisection method with an initial interval, tolerance, and maximum iterations
root = bisection(1.0, 3.0, 1e-6, 100)

# Print the result
if root !== nothing
    println("Approximate root: $root")
else
    println("Bisection method did not converge.")
end
