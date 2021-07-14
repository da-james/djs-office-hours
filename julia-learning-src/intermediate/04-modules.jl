# including files in the path
include("04a-prismMod.jl")
include("04b-circleMod.jl")

# importing modules into code
using .Prism_Mod
import .Circle_Mod

function main()

    # accessing Prism module
    # note how these functions use its namespace to access its use
    # namespace as in Prism_Mod.function()
    p = Prism_Mod.Prism()
    p1 = Prism_Mod.Prism(1, 2, 3)

    # Prism module exported function
    # while this function doesn't use the namespace
    println(volume(p))

    # accessing Circle module
    # note how even though this does have export in its module
    # it still needs its namespace i.e. Circle_Mod.function()
    c = Circle_Mod.Circle_const(5)
    println(c.radius)

end

main()