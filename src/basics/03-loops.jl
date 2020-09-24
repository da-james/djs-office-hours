# defining range to work with
r = 1:20

# set of lists I will go through
l1 = [i % 2 for i in r]
l2 = [i for i in r]
l3 = [i * 2 for i in r]
l4 = ["hello ", "how ", "are ", "you?"]

# print them out
# println(l1)
# println(l2)
# println(l3)

# ***** FOR LOOPS *****
# simple loop with editing elements
for i in r
    l2[i] += i
end

# loop accessing a string container
for word in l4
    print(word)
end

println(" ")

# same output as previous loop but using index instead
for i in 1:size(l4, 1)
    print(l4[i])
end

# nested loops
z = zeros(3, 4)
for c in 1:size(z, 2)
    for r in 1:size(z, 1)
        z[r, c] += r + c
    end
end

display(z)

# ***** WHILE LOOPS *****
global i
i = 0

while i < 5
    println(i)
    # i += 1        # incorrect
    global i += 1   # correct
end