# creating a module
module Prism_Mod

# exporting a function for aliasing
# export only works with `using` keyword
export volume

struct Prism
    length::Real
    width::Real
    height::Real

    function Prism()
        new(1, 1, 1)
    end

    function Prism(l::Real, w::Real, h::Real)

        if l < 0 || w < 0 || h < 0
            error("Can't have negative values for lengths.")
        elseif w < l
            error("Can't have shorter width than length.")
        else
            new(l, w, h)
        end
    end
end

function volume(p::Prism)
    v = p.length * p.width * p.height
end

function surface_area(p::Prism)
    s1 = p.length * p.width
    s2 = p.length * p.height
    s3 = p.width * p.height

    sa = 2 * (s1 + s2 + s3)
end

end # end of module