using Polynomials
using LsqFit

using Plots

function main()

    # nonlinear fit stuff 
    p0 = [0.5, 0.5]                         # guess
    model(t, p) = p[1] * exp.(-p[2] * t)    # model trying to fit
    model1(t, p) = p[1] * sin.(p[2] * t) + p[3]

    xdata = range(0, stop=10, length=20)
    ydata = model(xdata, [1.0 2.0]) + 0.01*randn(length(xdata))

    # poly_fit(xdata, ydata)
    nlin_fit(model, xdata, ydata, p0)

end

function poly_fit(xdata, ydata)

    pfit1 = fit(xdata, ydata, 1)
    pfit2 = fit(xdata, ydata, 2)
    pfit3 = fit(xdata, ydata, 3)

    xlin = range(xdata[1], xdata[end], length=200)

    # plotting
    scatter(xdata, ydata, markersize=3, legend=:topright, label="data")
    # plot!(xlin, pfit1.(xlin), linestyle=:dash, label="f(x) = x")
    # plot!(xlin, pfit2.(xlin), label="f(x) = x²")
    # plot!(xlin, pfit3.(xlin), label="f(x) = x³", dpi=200)

    pfit1 = fit(xdata[1:5], ydata[1:5], 3)
    pfit2 = fit(xdata[5:end], ydata[5:end], 1)

    plot!(xlin[1:50], pfit1.(xlin[1:50]), label="f(x) = x³")
    plot!(xlin[50:end], pfit2.(xlin[50:end]), label="f(x) = x", dpi=200)

    xaxis!("x")
    yaxis!("y")
    title!("poly fit")

end

function nlin_fit(model, xdata, ydata, p0)

    nlinfit = curve_fit(model, xdata, ydata, p0)
    pfit = nlinfit.param
    print(pfit)
    xlin = range(xdata[1], xdata[end], length=200)

    scatter(xdata, ydata, markersize=3, legend=:topright, label="data")
    plot!(xlin, model(xlin, [p0[1], p0[2]]), label="initial model")
    plot!(xlin, model(xlin, [pfit[1], pfit[2]]), linestyle=:dash, label="fitted model", dpi=200)

    xaxis!("x")
    yaxis!("y")
    title!("nonlinear fit")

end


main()