# defining an empty array
l = []

# pushing values into an empty container
push!(l, 1)             # push a value 
push!(l, 2, 3)          # or push a couple values
append!(l, [4, 5, 6])   # or append a container

# defining an undefined array
arr1 = Array{Float64}(undef, 1)
arr2 = Array{Int}(undef, 1)

# defining an undefined array of different sizes
arr3 = Array{Real}(undef, 2, 3)         # 2D
arr4 = Array{Number}(undef, 5, 6, 7)    # 3D

# range sets
r = range(1, 10, length=100)    # step range
u = 1:.005:2                    # unit range

# Float64 of zeros and ones
z = zeros(10)
o = ones(5)

# list comprehension
l1 = [i for i in 1:20]
l2 = [2*i for i in 1:20]