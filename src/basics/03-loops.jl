r = 1:20

l1 = [i % 2 for i in r]
l2 = [i for i in r]
l3 = [i * 2 for i in r]
l4 = ["hello ", "how ", "are ", "you?"]

# println(l1)
# println(l2)
# println(l3)

# for i in r
#     l2[i] += i
# end
# for word in l4
#     print(word)
# end
# println(" ")
# for i in 1:size(l4, 1)
#     print(l4[i])
# end

# global i
# i = 0

# while i < 5
#     println(i)
#     # local i
#     # i += 1
#     # global i += 1
# end

z = zeros(3, 4)
for c in 1:size(z, 2)
    for r in 1:size(z, 1)
        z[r, c] += r + c
    end
end

display(z)