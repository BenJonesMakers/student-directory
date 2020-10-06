def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat the code
  while !name.empty? do
	  # add the student hash to the array
    students << {name: name, cohort: :november}
    # get another name from the user
    name = gets.chomp
  end
	return students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  counter = 0
  while counter <= students.count - 1 do
    student = students[counter]
    if student[:name].length < 12
      puts "#{counter + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
    counter += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

# main program
students = input_students
print_header
print(students)
print_footer(students)
