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
      case el[2]
      when "win"
        teams[el[0]][0] += 1
        teams[el[0]][1] += 1
        teams[el[0]][4] += 3
        teams[el[1]][0] += 1
        teams[el[1]][2] += 1
      when "draw"
        teams[el[0]][0] += 1
        teams[el[1]][0] += 1
        teams[el[0]][2] += 1
        teams[el[1]][2] += 1
        teams[el[0]][4] += 1
        teams[el[1]][4] += 1
      when "loss"
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
      arr=str.chars
       return arr.map{ |el|
        case el
        when 'G'
          'C'
        when 'C'
          'G'
        when 'T'
          'A'
        when 'A'
         'U'
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
    leng_of_sub=char.ord-"A".ord+3
    leng_of_super=(char.ord-"A".ord)*2+1
    sub_string="*"*leng_of_sub+"\n"
    super_string=[sub_string]*leng_of_super
    for i in ('A'..char)
      super_string[i.ord-'A'.ord][]
    end
    return super_string
  end
end
p Diamond.make_diamond('C')