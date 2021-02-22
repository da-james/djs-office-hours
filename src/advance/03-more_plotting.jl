using Plots
using Statistics

function main()

    x = range(1, 5, length=100)
    l = size(x)
    noise = rand(-2:0.5:2, l)

    y1 = exp.(x) .+ noise
    y2 = exp.(x)
    yerr = std(noise)

    # normal_plot(x, y1, y2, yerr)
    # log_plots(x, y1, y2)
    # subplots(x, y1, y2, yerr)

end

function normal_plot(x, y1, y2, yerr)

    scatter(x, y1, yerr=yerr, markersize=2, markershape=:o, alpha=0.5, label="data")
    plot!(x, y2, color="red", legend=:topleft, label="f(x)", dpi=200)
    
    annotate!(3, 50, Plots.text("Hello world!", 5, :red))

    xaxis!("x")
    yaxis!("y")
    title!("simple plot")

end


function log_plots(x, y1, y2)

    scatter(x, y1, markersize=1, markershape=:o, label="data")
    plot!(x, y2, xaxis="x", yaxis=("y", :log), legend=:topleft, label="f(x)", dpi=200)

    title!("log plot")

end

function subplots(x, y1, y2, yerr)

    p1 = scatter(x, y1,yerr=yerr, markershape=:o, markersize=1, alpha=0.5, label="data")
    p1 = plot!(x, y2, yaxis="y", legend=:topleft, label="f(x)", title="α data")

    p2 = scatter(x, y1, label="label")
    p2 = plot!(x, y2, xaxis="x", yaxis=("y", :log), legend=:topleft, label="f(x)")

    plot(p1, p2, layout=(2,1), dpi=200)

end

main()