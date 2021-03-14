# opening ASCI files
using DelimitedFiles

# opening matlab files
using MAT

# opening csv files
using CSV
using DataFrames


function main()

    asci_file = "fort.56"
    # open_asci(asci_file)

    csv_file = "data2.csv"
    open_csv(csv_file)

    mat_file = "data.mat"
    # open_mat(mat_file)

end

function open_asci(af)

    # delimited lib
    f = readdlm(af)

    display(f)
    println(f[1:5,1])


end

function open_csv(cf)

    f = CSV.read(cf, DataFrame)
    display(cf)
    println(f[1:5,1])

    f = readdlm(cf, ',')
    display(f)
    println(f[1:5,1])

end


function open_mat(mf)

    file = matopen("data.mat")
    data = MAT.read(file)

    println(typeof(data))

end


main()