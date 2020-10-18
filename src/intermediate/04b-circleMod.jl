module Circle_Mod

mutable struct Circle
    radius
end

export Circle_const

function Circle_const(r::Real)
    Circle(r)
end

end # end of module