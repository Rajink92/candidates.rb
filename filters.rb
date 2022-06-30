# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
require './candidates'

def find(id)
  @candidates.each do |i|
    if i[:id] == id
      return i
    end  
  end
end

# More methods will go below

def check_qualification?(candidate)
  candidate[:years_of_experience] >= 2 &&
  candidate[:github_points] >= 100 &&
  candidate[:languages].include?('Ruby'|| 'Python') &&
  candidate[:date_applied] >= 15.days.ago.to_date &&
  candidate[:age] >= 18
end


def qualified_candidates
  arr = Array.new(0)
  @candidates.each do |i|
    if check_qualification?(i)
      arr << i 
    end
  end
  arr
end


def ordered_by_qualifications
  @candidates.sort_by {|v| [v[:years_of_experience], v[:github_points]]}.reverse
end


def repl
  @ok = true

  loop do
  puts "To find someone's id, enter: find (number)
        To see all the candidates, enter: all
        To see who is qualified, enter: qualified
        To see who the is most qualified in order: most qualified
        To quit, quit"

  input = gets.chomp
  input.downcase!

  case
  when input == "find 5" 
    pp @candidates[0]
  when input == "find 7" 
    pp @candidates[1]
  when input == "find 9" 
    pp @candidates[2]
  when input == "find 10" 
    pp @candidates[3]
  when input == "find 11" 
    pp @candidates[4]
  when input == "find 13" 
    pp @candidates[5]
  when input == "find 15" 
    pp @candidates[6]
  when input == "qualified"
    pp qualified_candidates
  when input == "most qualified"
    pp ordered_by_qualifications
  when input == "all"
    pp @candidates
  else 
    puts "nope"
    break if input == "quit"
  end
end

end
