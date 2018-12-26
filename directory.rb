def interactive_menu
  students = []
  loop do
    puts "1. Input the students."
    puts "2. Show the students."
    puts "9. Exit."
    selection = gets.chomp
    case selection
      when "1"
        students = input_students(students)
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I don't know what you mean. Try again."
    end
  end
end

def input_students(students)
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
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
    names.each.with_index(1) do |name, index|
      puts "#{index}. #{name[:name]} (#{name[:cohort]} cohort)"
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

interactive_menu
