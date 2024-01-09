function f(x)
    return x^3 - 2x^2 + 4x - 8
end

function false_position_method(a, b, tolerance, max_iterations)
    iteration = 0
    
    println("Iteration  |  a  |  b  |  x  ")
    println("______________________________________")
    
    while iteration < max_iterations
        fa = f(a)
        fb = f(b)
        
        x = a - fa * (b - a) / (fb - fa)
        
        println("   $iteration      |   $a  |   $b  |   $x")
        
        if abs(f(x)) < tolerance
            println("Root found at x ≈ $x after $iteration iterations.")
            return x
        end
        
        if f(a) * f(x) < 0
            b = x
        else
            a = x
        end
        
        iteration += 1
    end
    
    println("False position method did not converge within the specified number of iterations.")
    return nothing
end

# Call the false position method with initial bounds, tolerance, and maximum iterations
root = false_position_method(2.0, 3.0, 1e-6, 100)

# Print the result
if root !== nothing
    println("Approximate root: $root")
else
    println("False position method did not converge.")
end
