def interactive_menu
students = []
  loop do
    # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
		# 2. read the input and save it into a variable
    selection = gets.chomp
		# 3. do what the user has asked
		case selection
			when "1"
				# input the students
				students = input_students
			when "2"
				# show the students
				print_header
				print(students)
				print_footer(students)
			when "9"
				exit # terminates the program
			else
				puts "I don't know what you meant, try again"
		end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  # get the first name
  name = gets.strip
  # while the name is not empty, repeat the code
  while !name.empty? do
		puts "And their DB"
		dob = gets.strip
    puts "Enter cohort (default:november)"
    cohort = gets.strip
	  # add the student hash to the array
    if cohort.empty?
      students << {name: name, cohort: :november, dob: dob}
    else
      students << {name: name, cohort: cohort, dob: dob}
    end
    # get another name from the user
    puts "Name? (enter twice to finish)"
    name = gets.chomp
  end
	return students
end

def print_header
  puts "The students of Villains Academy".center(45, "-")
  puts "-------------".center(45, "-")
end

def print(students)
  if !students.empty?
	# get groups as a new array and strips the duplicates
  cohorts = students.map {|student| student[:cohort].to_s}.uniq
  cohorts.each do |cohort|
    puts "Cohort: #{cohort}".center(45, "-")
    students.each do |student|
      if student[:cohort].to_s == cohort
        puts "#{student[:name]} - DoB: #{student[:dob]}".center(45)
      end
     end
   end
  end
end

def print_footer(students)
  if students.count > 1
    puts "Overall, we have #{students.count} great students".center(45, "-")
  else
    puts "Overall, we have #{students.count} great student".center(45, "-")
  end
end

interactive_menu
