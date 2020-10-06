def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat the code
  while !name.empty? do
		puts "And their DB"
		dob = gets.chomp
	  # add the student hash to the array
    students << {name: name, cohort: :november, dob: dob}
    # get another name from the user
    name = gets.chomp
  end
	return students
end

def print_header
  puts "The students of Villains Academy".center(45, "-")
  puts "-------------".center(45, "-")
end

def print(students)

  students.each_with_index do |student, index|
    if student[:name].length < 12
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort) - DoB: #{student[:dob]}".center(45)
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(45, "-")
end

# main program
students = input_students
print_header
print(students)
print_footer(students)
