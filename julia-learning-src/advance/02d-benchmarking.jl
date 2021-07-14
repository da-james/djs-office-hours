using BenchmarkTools
using Random

f(x) = 3x.^2 + 4x + 7x.^3
fdot(x) = 3 .* x.^2 .+ 4 .* x .+ 7 .* x.^3

function main()

    x = randn(10000)

    # @benchmark f($x)
    # @benchmark fdot($x)
    @benchmark f.($x)
end

main()