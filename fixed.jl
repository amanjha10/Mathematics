# Define the function for which you want to find the root
function f(x)
    return x^3 + x^2 - 1
end

function f_prime(x)
    return 3x^2 + 2x
end

# Define g(x) and y = x functions
function g(x)
    return 1 / (x^2 + 1)
end

y = x -> x  # Define y as a function of x

function fixed_point_iteration(initial_guess, tolerance, max_iterations)
    x = initial_guess
    iteration = 0
    
    # Arrays to store iteration data for plotting
    iterations = Int[]
    x_values = Float64[]
    
    println("Iteration  |  x  ")
    println("__________________")
    
    while iteration < max_iterations
        x_new = x - f(x) / f_prime(x)
        
        push!(iterations, iteration)
        push!(x_values, x_new)
        
        println("   $iteration      |   $x_new")
        
        if abs(x_new - x) < tolerance
            println("Root found at x ≈ $x_new after $iteration iterations.")
            return x_new, iterations, x_values
        end
        
        x = x_new
        iteration += 1
    end
    
    println("Fixed-point iteration method did not converge within the specified number of iterations.")
    return nothing, iterations, x_values
end

# Call the fixed-point iteration method with an initial guess, tolerance, and maximum iterations
root, iterations, x_values = fixed_point_iteration(0.5, 1e-6, 100)
println("This value of x is $x_values")

# Print the result
if root !== nothing
    println("Approximate root: $root")
else
    println("Fixed-point iteration method did not converge.")
end

# Plot f(x), g(x), and y = x together
using Plots
# plot(iterations, x_values, label="Fixed-Point Iteration", xlabel="Iteration", ylabel="x", legend=:topright)
plot!(g, 0:0.1:1, label="g(x) = 1/(x^2 + 1)", linestyle=:dash)
plot!(y, 0:0.1:1, label="y = x", linestyle=:dash)

# Save the plot as an image file (e.g., PNG)
savefig("fixed_point_plot.png")
