# ***** FLOATS and INTS *****
# x = 3.2     # float
# y = 3       # int   
# z = 3.      # float

# println("x: ", typeof(x))
# println("y: ", typeof(y))
# println("z: ", typeof(z))
# println("sum: ", typeof(x + y), " ", x + y)

# ***** STRINGS and CHARS *****
# a = 'a'         # char
# word = "hello"  # string
# wrong = 'word'

# ***** BOOLEANS *****
# t = true
# f = false
# println(t, " ", typeof(t))
# println(f, " ", typeof(f))

# ***** control flow with if, elseif, else *****
x = -5
y = 0

if (x > 0) && (y > 0)
    println("x and y are positive")
elseif (x < 0) && (y < 0)
    println("x and y are negative")
elseif (x > 0) || (y > 0)
    println("x or y are positive")
else
    println("x and y are 0")
end

# ***** control flow with ternary operator *****
x > 0 ? println("x is positive") : println("x is negative")