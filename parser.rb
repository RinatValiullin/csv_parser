Dir["./decorators/*.rb"].each {|file| require file }

TYPES = {
  "int" => IntDecorator,
  "string" => StringDecorator,
  "money" => MoneyDecorator
}

path = ARGV[0]

file = File.open(path)

file_data = file.readlines.map(&:chomp)

data_types = file_data[0].split(";")

data_hash = []

file_data[1..file_data.length].each do |row|
  values = row.split(";")
  values.each_with_index do |value, index|
    data_hash[index] ||= []
    data_hash[index] << value
  end
end
p(data_hash)
data_hash.each_with_index do |values, index|
  type = data_types[index]
  data_hash[index] = TYPES[type].new(values).decorate
end

data = []

data_types.length.times do |index|
  data_hash.each do |values|
    data[index] ||= []
    data[index] << values[index]
  end
end

p data

print "hi","fred\nfred".center(80)


# puts("+-----------------+")
# string_index = data_types.index("string")
# result = "|"
# (file_data.length - 1).times do |index|
#   result += "|"
#   row = data_hash.values.map do |values|
#     values[index]
#   end
#   string_values = row.select { |elem| elem.kind_of? Array }
#   if string_values.empty?
#     result += row.join("|") + "|"
#   else
#     string_values.each_with_index do |value, index|
#       if index == 0
#         result +=
#       else
#       end
#     end
#   end
#   result += "\n"
#   result += "+--+----+---------+\n"
# end

# puts(result)
