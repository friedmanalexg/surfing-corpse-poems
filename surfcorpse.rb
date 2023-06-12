def prompt(message)
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
  lines = text.scan(/.{1,#{line_length}}/)
  puts lines.join("\n")
end

def write_to_file(filename, content)
  File.open(filename, "a") { |file| file.puts(content) }
end

def create_poetry_app
  puts "Welcome to the exquisite corpse app!"

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

    user_input = get_user_input("Enter up to 180 characters: ", 180)
    file_content += "#{user_input}\n"

    puts "\nYour input:"
    display_text_with_line_breaks(user_input, 40)
  end

  # Write content to file
  filename = "#{working_title}.txt"
  write_to_file(filename, file_content)

  puts "\nPoetry created! Each line has been saved in the file #{filename}."
end

# Call the method to run the app
create_poetry_app
