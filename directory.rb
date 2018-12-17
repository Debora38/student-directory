def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  # create an empty array
  students = []
  # get an input from the user
  name = gets.chomp
  # while the input is not empty, add the input to the array
  while !name.empty? do
    students << {name: name, cohort: :january}
    puts "Now we have #{students.count} students"
    # get another input to restart the loop
    name = gets.chomp
  end
  # return the array
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(names)
  index = 1
  names.each do |name|
    puts "#{index}. #{name[:name]} (#{name[:cohort]} cohort)"
    index += 1
  end
end

def print_footer(array)
  puts "Overall, we have #{array.count} great students"
end

students = input_students
# the method will return the array of students that we'll assign to the variable students
# and then pass to other methods for printing on the screen as a list.
print_header
print(students)
print_footer(students)
