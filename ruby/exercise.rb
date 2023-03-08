# ex1
class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    return @line.split(" ", 2)[1].strip
  end

  def log_level
    return @line.split(" ", 2)[0].strip[1..-3]
  end

  def reformat
    raise "#{}"
  end
end

p LogLineParser.new("[warning]: daay la canh bao\n").message
p LogLineParser.new("[warning]: daay la canh bao\n").log_level

def two_fer(name = "you")
  return "One for #{name}, one for me."
end

puts two_fer("alice")

#   ex2
class Tournament
  def self.tally(input)
    teams = input.split(/[;\n]/).reject { |el| el == "win" || el == "loss" || el == "draw" }.uniq.map { |el| [el, [0, 0, 0, 0, 0]] }.to_h
    matchs = input.split("\n").map { |el| el.split(";") }
    matchs.each do |el|
      case el[2].to_sym
      when :win
        teams[el[0]][0] += 1
        teams[el[0]][1] += 1
        teams[el[0]][4] += 3
        teams[el[1]][0] += 1
        teams[el[1]][2] += 1
      when :draw
        teams[el[0]][0] += 1
        teams[el[1]][0] += 1
        teams[el[0]][2] += 1
        teams[el[1]][2] += 1
        teams[el[0]][4] += 1
        teams[el[1]][4] += 1
      when :loss
        teams[el[1]][0] += 1
        teams[el[1]][1] += 1
        teams[el[1]][4] += 3
        teams[el[0]][0] += 1
        teams[el[0]][2] += 1
      end
    end
    sorted_teams = teams.sort_by { |key, value| -value[4] }
    table = "Team                           | MP |  W |  D |  L |  P\n"
    sorted_teams.each { |key, value| table = table + "%-31s|  #{value[0]} |  #{value[1]} |  #{value[2]} |  #{value[3]} |%3s\n" % [key, value[4]] }
    return table
  end
end

input = "Allegoric Alaskans;Blithering Badgers;win
  Devastating Donkeys;Courageous Californians;draw
  Devastating Donkeys;Allegoric Alaskans;win
  Courageous Californians;Blithering Badgers;loss
  Blithering Badgers;Devastating Donkeys;loss
  Allegoric Alaskans;Courageous Californians;win"
puts Tournament.tally(input)
puts " 12".size

# ex3
class Complement
  def self.of_dna(str)
    arr = str.chars
    return arr.map { |el|
             case el
             when "G"
               "C"
             when "C"
               "G"
             when "T"
               "A"
             when "A"
               "U"
             else
               el
             end
           }.join
  end
end

p Complement.of_dna("")

#ex4
class Diamond
  def self.make_diamond(char)
    a = (("A"..char).to_a.reverse + ("A"..char).to_a[1..-1]).join
    half_diamond = ("A"..char).map { |el| a.gsub(/[^#{el}]/, " ") + "\n" }
    half_bot_diamond = half_diamond.reverse[1..-1]
    diamond = (half_diamond + half_bot_diamond).join
  end
end

puts Diamond.make_diamond("C")
a = "CBABC"

# ex5
class UnsupportedOperation < StandardError
end

class SimpleCalculator
  ALLOWED_OPERATIONS = ["+", "/", "*"].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError unless first_operand.class.superclass == Numeric && second_operand.class.superclass == Numeric
    begin
      "#{first_operand} #{operation} #{second_operand} = #{}"
    rescue
      "sai"
    end
  end
end

# SimpleCalculator.calculate(1, 2, "+")
# a=[1,2,3,4,5]
# p a[2..]
# if a
#   puts "a"
# elsif
#   puts "b"
# else
#   puts "c"
# end
# p 2*"abc"
# a+b if TRUE
# def test

# end
# test
# puts Alias
# class Test
#   def print_something
#     puts "hello"
#   end
#   alias_method :hello,:print_something
# end
# a=Test.new
# a.print_something
# a.hello
# ex6
module Check
  def self.check_symmetry(param)
    case param
    when Integer
      a = "#{param}"
      a == a.reverse ? "day la so doi xung" : "khong phai so doi xung"
    when String
      param == param.reverse ? "day la chu doi xung" : "khong phai chu doi xung"
    else
      raise ArgumentError.new("invalid argument")
    end
  end
end

puts Check.check_symmetry("abc")

# ex7
class Attendee
  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?
    return @pass_id ? true : false
  end

  def fits_ride?(ride_minimum_height)
    return height >= ride_minimum_height ? true : false
  end

  def allowed_to_ride?(ride_minimum_height)
    return @pass_id && height >= ride_minimum_height ? true : false
  end
end

Attendee.new(100).has_pass?

# class Parent
#   def initialize
#     hello
#   end
#   private
#   def hello
#     puts "hello"
#   end
# end
# class Child<Parent
#   def initialize
#     super
#   end
# end
# Child.new()

# ex8
class Acronym
  def self.abbreviate(str)
    return str.split(/[^a-zA-Z0-9]/).map { |el| el[0] }.join.upcase
  end
end

p Acronym.abbreviate("Hello Hanh+hanh")

# ex9
class Isogram
  def self.isogram?(input)
    iso = input.scan(/\w+/).join.downcase.chars.uniq.join
    puts iso
    return iso == input.scan(/\w+/).join.downcase
  end
end

p Isogram.isogram?("Emily Jung Schwartzkopf")

# ex10
class Pangram
  def self.pangram?(sentence)
    ("a".."z").each { |el|
      unless sentence.include?(el)
        return false
      end
    }
    true
  end
end

Pangram.pangram?("")

# ex11
class IsbnVerifier
  def self.valid?(str)
    arr = str.scan(/[0-9X]/)
    unless arr.length == 10
      return false
    end
    sum = 0
    arr.each_with_index do |value, key|
      if value == "X"
        sum += 10 * (10 - key)
        unless key == 9
          return false
        end
      else
        sum += value.to_i * (10 - key)
      end
    end
    return sum % 11 == 0
  end
end

puts IsbnVerifier.valid?("3-598-2X507-9")
puts Integer === 2

#ex12
class AssemblyLine
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    case @speed
    when (1..4)
      @speed * 221
    when (5..8)
      @speed * 221 * 0.9
    when 9
      @speed * 221 * 0.8
    when 10
      @speed * 221 * 0.77
    end
  end

  def working_items_per_minute
    self.production_rate_per_hour / 60
  end
end

p AssemblyLine.new(6).working_items_per_minute

#ex13
class Bob
  QUESTION_FORMAT = /[a-z0-9]+[?]$/
  YELL_FORMAT = /[A-Z0-9]+[^?]$/
  YELL_QUESTION_FORMAT = /[A-Z0-9]+[?]$/

  def self.hey(str)
    case str
    when QUESTION_FORMAT
      "Sure"
    when YELL_FORMAT
      "Whoa, chill out!"
    when YELL_QUESTION_FORMAT
      "Calm down, I know what I'm doing!"
    when ""
      "Fine. Be that way!"
    else
      "What ever"
    end
  end
end

# ex14
class Bob
  def self.hey(str)
    return 'Fine. Be that way!' if str.strip==""
    str=str.strip
    case str[-1]
    when '?'
      if(str.upcase==str&&str.upcase!=str.downcase)
        "Calm down, I know what I'm doing!"
      else
        "Sure."
      end
    else
      if(str.upcase==str&&str.upcase!=str.downcase)
        "Whoa, chill out!"
      else
        'Whatever.'
      end
    end
  end
end
p Bob.hey("You are, what, like 15?")
class Upcaser
  def initialize(value)
    @value = value
  end

  def +(other)
    self.class.new(@value + other.value)
  end

  def to_s
    @value.upcase
  end

  attr_reader :value
  protected :value
end

puts Upcaser.new("Hello") + Upcaser.new("World")