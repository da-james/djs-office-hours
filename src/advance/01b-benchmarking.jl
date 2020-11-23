using Random
using BenchmarkTools

function row_major(A::Array{Float64}, B::Array{Float64})

    m, n = size(A)
    n, p = size(B)

    C = Array{Float64}(undef, m, p)

    for i in 1:m
        for j in 1:p
            for k in 1:n
                C[i,j] += A[i,k] * B[k, j]
            end
        end
    end

    return C

end

function col_major(A::Array{Float64}, B::Array{Float64})

    m, n = size(A)
    n, p = size(B)

    C = Array{Float64}(undef, m, p)

    for j in 1:p
        for i in 1:m
            for k in 1:n
                C[i,j] += A[i,k] * B[k, j]
            end
        end
    end

    return C

end

function main()

    n = 1000

    A = randn(n,n)
    B = randn(n,n)

    # Cr = row_major(A, B)
    # Cc = col_major(A, B)
    # print(Cr == Cc)

    # @benchmark row_major($A, $B)
    @benchmark col_major($A, $B)

end

main()