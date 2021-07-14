using BenchmarkTools

function my_append()

    v = []

    for i in 1:10000
        push!(v, 5)
    end
end

function my_prealloc()

    v = Vector{Int64}(undef, 10000)

    for i in 1:10000
        v[i] = 5
    end
end

# @benchmark my_append()
@benchmark my_prealloc()