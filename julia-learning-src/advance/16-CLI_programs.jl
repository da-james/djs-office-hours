using ArgParse
using DelimitedFiles
using Plots

function parse_commandline()

    s = ArgParseSettings()

    @add_arg_table! s begin

    "--display", "-d"
    help = "displays data"
    arg_type = Bool
    default = false

    "--plot", "-p"
    help = "plots data"
    arg_type = Bool
    default = false

    "path"
    help = "path to data file"
    required = true
        
    end

    return parse_args(s)

end

function main()

    parsed_args = parse_commandline()

    data = parse_data(parsed_args["path"])

    if parsed_args["display"] == true
        show_data(data)
    elseif parsed_args["plot"] == true
        plot_data(data)
    end

    println("PROGAM DONE")

end

function parse_data(path)

    data = readdlm(path)
    return data

end

function show_data(data)

    display(data)

end

function plot_data(data)

    scatter(data[:,1], data[:,2], dpi=300)
    savefig("plots.png")

end

main()














