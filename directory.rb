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
    puts "Enter cohort (default:november)"
    cohort = gets.chomp
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

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(45, "-")
end

# main program
students = input_students
print_header
print(students)
print_footer(students)
