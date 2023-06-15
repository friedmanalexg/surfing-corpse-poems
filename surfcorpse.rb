def prompt(message)
  #a function for displaying a message and requesting user input
  puts message
  print "> "
end

def get_integer_input(prompt_message)
  input = nil
  loop do
    prompt(prompt_message)
    input = gets.chomp
    break if input.match(/^\d+$/)
    puts "Please enter a valid number."
  end
  input.to_i
end

def get_user_input(prompt_message, max_characters)
  input = ""
  loop do
    prompt(prompt_message)
    input = gets.chomp[0...max_characters]
    break unless input.empty?
    puts "Please enter some text."
  end
  input
end

def display_text_with_line_breaks(text, line_length)
  #just a really elegant way to put this text together, wow
  lines = text.scan(/.{1,#{line_length}}/)
  puts lines.join("\n")
end

def write_to_file(filename, content)
  File.open(filename, "a") { |file| file.puts(content) }
end

def create_poetry_app
  puts "@-->--->---"
  puts "Welcome to the exquisite corpse app!"
  puts "@-->--->---"

  # Get working title
  working_title = get_user_input("Enter the working title: ", 180)

  # Get number of writers
  num_writers = get_integer_input("How many writers will be featured?")

  # Get number of rounds
  num_rounds = get_integer_input("How many rounds will the app pass?")

  # Generate the poetry pattern
  total_iterations = num_writers * num_rounds
  file_content = ""

  total_iterations.times do |iteration|

    puts "\nIteration #{iteration + 1}:"

    user_input = get_user_input("Write your line. Enter up to 180 characters: ", 180)
    file_content += "#{user_input}\n"
    40.times do 
      #this literally just skips 40 lines in the console output to hide the previous line
      puts "#"
    end
    puts "\nThe previous line, for context:"
      #the bot misinterpreted my directions here, but we'll keep the line break and adjust it for aesthetics
    display_text_with_line_breaks(user_input, 90)
  end

  # Write content to file
  filename = "#{working_title}.txt"
  write_to_file(filename, file_content)

  puts "\nPoetry created! Your exquisite corpse has been written to the file #{filename}."
end

# Call the method to run the app
create_poetry_app
