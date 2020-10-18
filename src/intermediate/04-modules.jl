include("04a-prismMod.jl")
include("04b-circleMod.jl")

using .Prism_Mod
import .Circle_Mod

function main()

    p = Prism_Mod.Prism()
    p1 = Prism_Mod.Prism(1, 2, 3)

    println(volume(p))

    c = Circle_Mod.Circle_const(5)
    println(c.radius)

end

main()