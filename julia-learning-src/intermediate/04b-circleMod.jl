module Circle_Mod

export Circle_const

mutable struct Circle
    radius
end

function Circle_const(r::Real)
    Circle(r)
end

end # end of module