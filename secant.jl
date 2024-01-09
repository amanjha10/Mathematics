function f(x)
    return x^3 - 2x^2 + 4x - 8
end

function secant_method(initial_guess1, initial_guess2, tolerance, max_iterations)
    x0 = initial_guess1
    x1 = initial_guess2
    iteration = 0
    
    while iteration < max_iterations
        # Calculate the next estimate using the secant formula
        x2 = x1 - (f(x1) * (x1 - x0)) / (f(x1) - f(x0))
        
        if abs(x2 - x1) < tolerance
            println("Root found at x ≈ $x2 after $iteration iterations.")
            return x2
        end
        
        x0 = x1
        x1 = x2
        iteration += 1
    end
    
    println("Secant method did not converge within the specified number of iterations.")
    return nothing
end

# Call the secant method with initial guesses, tolerance, and maximum iterations
root = secant_method(2.0, 3.0, 1e-6, 100)

# Print the result
if root !== nothing
    println("Approximate root: $root")
else
    println("Secant method did not converge.")
end
