function main()

    call_your_code()

end

function call_your_code()

    l::Int64 = 3
    arrx = Vector{Float64}([5,5,5])
    arry = Vector{Float64}([2,3,7])
    s::Float64 = 5

    # x = ccall((:__mod_julfort_MOD_dot, "./mod_julfort.so"),
    #           Float64,
    #           (Ref{Int64}, Ptr{Float64}, Ptr{Float64}),
    #           l, arrx, arry)
    # println(x)

    println(arrx)
    ccall((:mult_arr, "./mod_julfort.so"),
          Cvoid,
          (Ref{Int64}, Ptr{Float64}, Ref{Float64}),
          l, arrx, s)
    println(arrx)

end

main()