@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def process(selection)
	case selection
		when "1"
			input_students
		when "2"
			show_students
		when "3"
      save_students
		when "4"
      load_students
		when "9"
			exit # terminates the program
		else
			puts "I don't know what you meant, try again"
	end
end

def input_students
  while true do
    puts "Please enter the names(to finish, hit enter twice)"
    name = STDIN.gets.chomp
    break if name.empty?
		puts "And their DB"
		dob = STDIN.gets.chomp
    puts "Enter cohort (default:november)"
    cohort = STDIN.gets.chomp
    if cohort.empty?
      add_to_students(name, dob, cohort="november")
    else
      add_to_students(name, dob, cohort)
    end
  end
end

def print_header
  puts "The students of Villains Academy".center(45, "-")
  puts "-------------".center(45, "-")
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
  student_data = [student[:name], student[:dob], student[:cohort]]
  csv_line = student_data.join(",")
  file.puts csv_line
  end
  file.close
  puts "Students list saved to file"
end

def try_load_students
  filename = ARGV.first # first get the arguement from the command line
  filename = "students.csv" if filename.nil?  # default to trying students.csv
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
   name, dob, cohort = line.chomp.split(',')
   if !name.nil?
		  add_to_students(name, dob, cohort)
   end
  end
  file.close
  puts "Students loaded from file: '#{filename}'"
end

def print_students
  if !@students.empty?
	# get groups as a new array and strips the duplicates
  cohorts = @students.map {|student| student[:cohort].to_s}.uniq
  cohorts.each do |cohort|
    puts "Cohort: #{cohort}".center(45, "-")
    @students.each do |student|
      if student[:cohort].to_s == cohort
        puts "#{student[:name]} - DoB: #{student[:dob]}".center(45)
      end
     end
   end
  end
end

def print_footer
  if @students.count > 1
    puts "Overall, we have #{@students.count} great students".center(45, "-")
  else
    puts "Overall, we have #{@students.count} great student".center(45, "-")
  end
end

def add_to_students(name, dob, cohort)
  @students << {name: name, cohort: cohort.to_sym, dob: dob}
end

def show_students
	print_header
	print_students
	print_footer
end

try_load_students # see if the user provided a command line arguement
interactive_menu
