
AvailableUrl.delete_all
UsedUrl.delete_all

# 62 characters below to the power of length_of_code variations
length_of_code = 2
characters = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
start = 0
r = []
while start < characters.length ** length_of_code do 
    value = ''
    hold = start
    length_of_code.times do
        value = characters[hold % characters.length] + value
        hold /= characters.length
    end 
    start += 1
    r << value
end 

puts r.length

while r.length > 0 do 
    i = rand r.length
    AvailableUrl.create! name: r[i]
    r.delete_at i 
end 

puts 'Created!'
