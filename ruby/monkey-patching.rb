# mokey-patching can re-open any class and change it’s methods.
# monkey patching is global so the above change affects all String instances in the application
a="HELLO Hanh"
# puts a.downcase
# class String
#     def downcase
#         self.upcase
#     end
# end
puts "hello world".downcase #=> "HELLO WORLD"
puts a.upcase #=> "HELLO HANH"

# We can limit the scope of monkey patching by calling refine inside the module

module StringExtensions
  refine String do
    def downcase
      self.upcase
    end
  end
end

class ExampleUsingRefine
  using StringExtensions
  def print(word)
    puts word.downcase
  end
end
class ExampleUnUsingRefine
  def print(str)
    puts str.downcase
  end
end

ExampleUsingRefine.new.print("Hello") #=> "HELLO"
ExampleUnUsingRefine.new.print("Hello") #=> "hello"