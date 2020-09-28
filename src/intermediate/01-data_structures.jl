# Array Containers                  size
v = Vector{Int64}(undef, 5)         # 5
m = Matrix{Float64}(undef, 3, 4)    # 3, 4
a = Array{Real}(undef, 2, 2, 3)     # 2, 2, 3

# Tuple Containers -- immutable
t = ("hello", 3, 4.5)
nt = (a="world", b=5, c='a')
println("keys ", keys(nt))
println("values ", values(t))

# Dictionary Containers
d = Dict('a'=>3.4, "hello"=>t[2], 1=>nt.a)
println("keys ", keys(d))
println("values ", values(d))