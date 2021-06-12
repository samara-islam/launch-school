# Mad libs are a simple game where you create a story template 
# with blanks for words. You, or another player, then construct
# a list of words and place them into the story, creating an
# often silly or funny story as a result.

# Create a simple mad-lib program that prompts for a noun, 
# a verb, an adverb, and an adjective and injects those into a 
# story that you create.

# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

def prompt(str)
  puts "=> #{str}"
end

def mad_libs
  # 1. Prompt user for noun. Store as variable.
  prompt "Please enter a noun:"
  noun = gets.chomp

  # 2. Prompt user for verb. Store as variable.
  prompt "Please enter a verb:"
  verb = gets.chomp

  # 3. Prompt user for adjective. Store as variable.
  prompt "Please enter an adjective:"
  adjective = gets.chomp

  # 4. Prompt user for adverb. Store as variable.
  prompt "Please enter an adverb:"
  adverb = gets.chomp

  # 5. Interpolate nouns into madlibs string
  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}?"
end

mad_libs




