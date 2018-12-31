@students = []
require 'csv'

def interactive_menu
  loop do
    print_menu
    options_choice(STDIN.gets.chomp) # improved from: selection = gets.chomp \n process(selection)
  end
end

def options_choice(selection)
  case selection
  when "1" then @students = input_students
  when "2" then show_students
  when "3" then save_students
  when "4"
    puts "Where do you want to load from?" # if I ask it in the method, it will ask at program start
    filename = gets.chomp
    load_students(filename)
  when "9" then exit
  else
    puts "I don't know what you mean. Try again."
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit."
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students\nTo finish, hit return twice"
  # get an input from the user
  name = STDIN.gets.chomp
  # while the input is not empty, add the input to the array
  while !name.empty? do
    puts "What's his/her cohort start?"
    cohort = STDIN.gets.chomp
    add_student(name, cohort)
    if @students.count == 1
      puts "Now we have 1 student. Add more:"
    else
      puts "Now we have #{@students.count} students. Add more:"
    end
    # get another input to restart the loop
    name = STDIN.gets.chomp
  end
  # return the array
  @students
end

def print_header
  puts title = "The students of my cohort at Makers Academy"
  puts "-------------".center(title.size)
end

def print_students_list
  if @students.empty?
    puts "No students yet."
  else
    @students.each.with_index(1) do |name, index|
      puts "#{index}. #{name[:name]} (#{name[:cohort]} cohort)"
    end
  end
end

def print_footer
  if @students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def save_students(filename = "students.csv")
  puts "Where do you want to save in?"
  filename = gets.chomp
  CSV.open(filename, "w") do |csv_file|
    @students.each do |student|
      csv_file << [student[:name], student[:cohort]]
    end
  end
  puts "Students saved."
end

def load_students(filename = "students.csv")
  CSV.foreach(filename) do |line|
    add_student(line[0], line[1])
  end
  puts "Students loaded from #{filename}."
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students(filename = "students.csv") # why does this not avoid the line below?
  filename = ARGV.first
  filename = "students.csv" if filename.nil? # why does it not work by default with the above?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}."
  else
    puts "Sorry, #{filename} does not exist."
    exit
  end
end

try_load_students
interactive_menu
