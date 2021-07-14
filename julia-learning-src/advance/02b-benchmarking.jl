using Random
using BenchmarkTools

function row_major(A::Array{Float64})

    m, n = size(A)

    for i in 1:m
        for j in 1:n
            A[i,j] = 1
        end
    end

end

function col_major(A::Array{Float64})

    m, n = size(A)

    for j in 1:n
        for i in 1:m
            A[i,j] = 1
        end
    end

end

function main()

    n = 100

    A = randn(n,n)

    # @benchmark row_major($A)
    @benchmark col_major($A)

end

main()