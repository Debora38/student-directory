def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  # create an empty array
  students = []
  # get an input from the user
  name = gets.chomp
  # while the input is not empty, add the input to the array
  while !name.empty? do
    puts "What's his/her cohort start?"
    cohort = gets.chomp
    students << {name: name, cohort: cohort}
    if students.count == 1
      puts "Now we have 1 student. Add more:"
    else
      puts "Now we have #{students.count} students. Add more:"
    end
    # get another input to restart the loop
    name = gets.chomp
  end
  # return the array
  students
end

def print_header
  puts title = "The students of my cohort at Makers Academy"
  puts "-------------".center(title.size)
end

def print(names)
  if names.empty?
    puts "No students yet."
  else
    puts "Which cohort do you want to list?"
    cohort_choice = gets.chomp
    print_header
    names.each.with_index(1) do |name, index|
      if name[:cohort] == cohort_choice
        puts "#{index}. #{name[:name]} (#{name[:cohort]} cohort)"
      end
    print_footer(names)
    end
  end
end

def print_footer(array)
  if array.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{array.count} great students"
  end
end

students = input_students
# the method will return the array of students that we'll assign to the variable students
# and then pass to other methods for printing on the screen as a list.
print(students)
