# Class,method practice
class Person
    def initialize(name,age,phone_number)
        @name=name
        @age=age
        @phone_number=phone_number
    end
    def name
        @name
    end
    def age
        @age
    end
    def phone_number
        @phone_number
    end
    def name=(name)
        @name=name
    end
    def age=(age)
        @age=age
    end
    def phone_number=(phone_number)
        @phone_number=phone_number
    end
    def to_s
        "My name is #{@name}, i'm #{@age} years old, my number is #{@phone_number}"
    end
end



class Person
    attr_accessor :name,:age,:phone_number
    def initialize(name,age,phone_number)
        @name=name
        @age=age
        @phone_number=phone_number
    end
    def to_s
        "My name is #{@name}, i'm #{@age} years old, my number is #{@phone_number}"
    end
    def self.class_name
        "Person"
    end
    def work_at
        raise NoMethodError, "work_at is a abstraction method and must be implemented in the subclass"
    end
    private
    def private_method
        "this is a private method and cant call outside of class"
    end
end
p1=Person.new("hanh",22,"0886139065")
puts p1.to_s
p1.name="hieu"
puts p1.to_s
# puts Person.private_method #undefined method `private_method' for Person:Class (NoMethodError)
# puts p1.work_at #error

class Employee<Person
    attr_accessor :job
    def initialize(name,age,phone_number,job)
        super(name,age,phone_number)
        @job=job
    end
    def to_s
        "My name is #{@name}, i'm #{@age} years old, my number is #{@phone_number},I'm #{@job}"
    end
    def work_at
        "company"
    end
end
emp1=Employee.new("hanh",22,"0886139065","intern")
puts emp1.job #=> 'intern'
puts emp1.to_s #=> My name is hanh, i'm 22 years old, my number is 0886139065,I'm intern
puts emp1.work_at #=> company
# puts emp1.class_name # error



# --------------------------------------------------------------------------------------------------------------------------------------
# modules practice
module Support
  def my_info
    "#{self.class} \(\##{self.object_id}\) #{self.to_s}"
  end
end
class Employee<Person
  include Support
  attr_accessor :job
  def initialize(name,age,phone_number,job)
      super(name,age,phone_number)
      @job=job
  end
  def to_s
      "My name is #{@name}, i'm #{@age} years old, my number is #{@phone_number},I'm #{@job}"
  end
  def work_at
      "company"
  end
end
emp1=Employee.new("hanh",22,"0886139065","intern")
p emp1.my_info

#module is used to collect related methods, constants, and classes to avoid name conflicts
module Tomosia
  class Developer
    attr_accessor :name,:age,:phone_number
    def initialize(name,age,phone_number)
      @name=name
      @age=age
      @phone_number=phone_number
    end
  end
  class Tester
    attr_accessor :name,:age,:phone_number
    def initialize(name,age,phone_number)
      @name=name
      @age=age
      @phone_number=phone_number
    end
  end
end

module AbcCompany
  class Developer
    attr_accessor :name,:age,:phone_number
    def initialize(name,age,phone_number)
        @name=name
        @age=age
        @phone_number=phone_number
      end
    end
  class Tester
    attr_accessor :name,:age,:phone_number
    def initialize(name,age,phone_number)
      @name=name
      @age=age
      @phone_number=phone_number
    end
  end
end
p Tomosia::Developer.new("hanh",22,"0886139065")
p AbcCompany::Developer.new("hanh",22,"0886139065")


# --------------------------------------------------------------------------------------------------------------------------------------
# exception practice
#rescue
begin
  1/0
rescue => e
  puts "Exception Class: #{e.class.name}"
  puts "Exception Message: #{e.message}"
  puts "Exception Backtrace: #{e.backtrace}"
  # puts e.methods.sort
end

begin
  emp2=Employee.new("",22)
rescue => e  
  puts "Exception Class: #{e.class.name}"
  puts "Exception Message: #{e.message}"
end
#raise
begin
  raise ArgumentError.new("You messed up!")
rescue ArgumentError => e  
  puts "Exception Class: #{e.class.name}"
  puts "Exception Message: #{e.message}"
end
begin
  a=gets.chomp
  unless (a===/^[a-zA-Z0-9]*$/)
    raise "khong dc nhap khoang trang"
  end
rescue => e
  puts "Exception Message: #{e.message}"
  p e
ensure
  puts "the code in here is sure to run"
end
# begin
#   require 'does/not/exist'
# rescue => e
#   puts "hi"
# end #=> cant rescue because error in this code block isn't a StandardError

# custom exception
class MyException<StandardError
  attr_accessor :data
  def initialize(message="My default message",data)
    super(message)
    @data=data
  end
end
begin
  employee={name:"hanh", id: 0}
  if(employee[:id]==0)
    raise MyException.new("Id cua nhan vien khong hop le",employee)
  end
rescue MyException=>e
  p e.message
  p e.data
end

# --------------------------------------------------------------------------------------------------------------------------------------
#Block, Proc and Lambda
#my_each,my_each_with_index,my_map
class Array
  def my_each
    for element in self
      yield(element)
    end
    self
  end
  def my_each_with_index
    i=0;
    for element in self
      yield(element,i)
      i+=1
    end
  end
  def my_map
    arr=[]
    for element in self
      arr<<yield(element)
    end
    return arr
  end
end
[1,2,3,4,5].my_each {|i| puts i}
[1,2,3,4,5].my_each_with_index{|el,i| puts [i,el].inspect}
puts [1,2,3,4,5].my_map {|el| el*2}.inspect


# --------------------------------------------------------------------------------------------------------------------------------------
#File I/O