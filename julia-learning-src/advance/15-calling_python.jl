using PyCall
using Plots

np = pyimport("numpy")


function main()

    # x = 5
    # x = [π 3.0 0 12312;
    #      5 12. 1 3412.]
    # display(np.sin(x))

    x = [1, 2, 3, 4, 5]
    y = [5, 3, 1, 3, 5]

    p = np.polyfit(x, y, 2)
    # display(p)

    x1 = 1:0.1:5
    p1 = np.polyval(p, x1)

    scatter(x, y, label="data")
    plot!(x1, p1, label="fit")

end


main()


