using LinearAlgebra
using Plots


function main()

    # vector_ops()
    matrix_ops()

end

function vector_ops()
    x = [1, 2, 3]
    y = [1; 2; 3]
    z = [1 2 3]
    q = [1 2 3; 4 5 6]

    # display(x)
    # display(y)
    # display(z)
    # display(q)

    # norm
    # println(norm(x))
    # println(x / norm(x))
    # println(normalize(x))

    # dot product
    # println(dot(x, y))
    # println(x ⋅ y)

    # cross product
    println(cross(x,y))
    println(x × y)

end

function matrix_ops()

    A = [0 2 4; 2 4 2; 3 3 1]
    B = ones(3,3)
    C = [1 1; 1 1; 1 1]

    # matrix multiplication
    # display(A * B)
    # display(A * C)

    # elementwise multiplication
    # display(A .* B)

    # special operations
    # println(tr(A))
    # println(det(A))
    # display(transpose(A))
    # display(eigvals(A))
    # display(eigvecs(A))
    # display(inv(A))

    # special matrices
    # D = [1 0 0; 0 1 0; 0 0 1]
    # display(D)
    # D = Diagonal(D)

    # linear system Ax = b
    A = [1 2; 1 -1]
    b = [5, -1]

    # A = factorize(A)
    # display(A)
    # display(A.L * A.U)

    x0 = A \ b

    xlin = range(0, 5, length=50)
    f(x) = 5 - 2x
    g(x) = -1 + x

    println(x0)

    plot(xlin, f.(xlin), label="f(x)", xaxis="x", yaxis="y")
    plot!(xlin, g.(xlin), label="g(x)", title="Showing Solved Values")
    scatter!((x0[2], x0[1]), label="solved values", dpi=150)
end


main()