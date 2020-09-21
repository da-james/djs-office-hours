# Hello world!!!
a = "Hello world!"
println(a)


# defining variables
x = 4
y = 3.2
z = x + y


# different types and values
println("x type: ", typeof(x), " | value: ", x)
println("y type: ", typeof(y), " | value: ", y)
# summation of two different types
println("z type: ", typeof(z), " | value: ", z)

# casting float to a string
msg = "Sum: " * string(z)
println(msg)
# showing z is still a float
println(z)

# explicitly changing z to the multiplication of x and y
z = x * y
println("mult: ", z)

