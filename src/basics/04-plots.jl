using Plots     # importing the package
gr()            # faster backend


# defining the range
x = 0:0.005:1

m = 1
b = 0
f = m * x .+ b  # linear
g = x .^ 2      # quadratic
h = x .^ 3      # cubic

# plot out the first function
# place legend in top left corner
plot(x, f, label="linear", legend=:topleft)
# edit existing plot
plot!(x, g, label="quadratic")
# increase resolution with dpi parameter
plot!(x, h, label="cubic", dpi=300)

# adding axis and title labels
xaxis!("x [-]")
yaxis!("f(x) [-]")
title!("polynomials")

# save the figure with string name
savefig("myawesomeplot.png")