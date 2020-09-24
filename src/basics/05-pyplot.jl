# From the PyPlot Github Repo
# https://github.com/JuliaPy/PyPlot.jl
using PyPlot    # importing the library

# creating x range from 0 to 2pi
x = range(0; stop=2*pi, length=1000);
# creating y range working on x
y = sin.(3 * x + 4 * cos.(2 * x));

# plotting out the relation with blue dashed effect
plot(x, y, color="blue", linewidth=2.0, linestyle="--")
title("A sinusoidally modulated sinusoid")