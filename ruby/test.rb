# this is a line comment
=begin
this is multiple line comment
this is multiple line comment
=end
END{
    puts "this code run in end of the program"
}
BEGIN{
    puts "this code run before the program is run"
}
# this is a global variable
puts $glb_var=10
# this is a const variable
CONST_VAR=10
class Person
    # this is a class variable
    @@total=0
    def initialize(name,age,phone_number)
        # there are instance variables. each instance has diff instance variable 
        @name=name
        @age=age
        @phone_number=phone_number
        @@total+=1
        $glb_var+=1
    end
    def display_detail
        puts @@total
        puts "Ten toi la #@name"
        puts "tuoi: #@age"
        puts "So dien thoai: #@phone_number\n"
        puts "global var: #$glb_var\n\n"
        puts "2 + 2"
    end
end
class Person1
    @@total=0
    def initialize(name,age,phone_number)
        # there are instance variables. each instance has diff instance variable 
        @name=name
        @age=age
        @phone_number=phone_number
        @@total+=1
        $glb_var+=1
    end
    def display_detail
        puts @@total
        puts "Ten toi la #@name"
        puts "tuoi: #@age"
        puts "So dien thoai: #@phone_number"
        self.display_global_var
    end
    def display_global_var
        puts "day la ham dc goi lai global var: #$glb_var\n\n"
    end

end
# create object
per1=Person.new("hanh",22,"0886139065")
per2=Person.new("hieu",22,"723749284")
per3=Person1.new("hanh",22,"0886139065")
per4=Person1.new("hieu",22,"723749284")
per1.display_detail()
per2.display_detail()
per3.display_detail()
per4.display_detail()
puts self
puts __FILE__
# string practice
# 
str="here is a string.\n"
str1=String.new("here is a string created by using String::new. \n")
str2=String("this is as string. \n")
puts str+str1+str2
# string substitution
str3=str1.sub('e','*')
puts str3 # => 'h*re is a string created by using String::new.' this method return a new string 
str3=str1.gsub('e','*')
puts str3 # => 'h*r* is a string cr*at*d by using String::new.'
puts str1.sub!('e','*') # => 'h*re is a string created by using String::new.' this method modify self and return self
h={'cat'=>'dog','dog'=>'cat'}
puts 'cat'.sub!('cat',h) #=> 'dog' if second arg is a hash and first arg same one of hash keys value of that key will replace the replacement
# whitespace strip
puts ' my name is hanh.   '.rstrip() # => ' my name is hanh.' this method strip leading space.similar is lstrip and strip
# string slice
puts str[0,4] #  =>'here' this method will return a string was sliced from self
# puts str
 puts (str[0,4]= "hello") # =>'hello' this method return replacement string and str will be modified
puts str #=> 'hello is a string.'
puts str.slice!(0,4) # => 'hell'
puts str # =>'o is a string.'
str[0,4] # tra ve chuoi co 4 ky tu dc cat tu index 0
str[0] # tra ve chuoi co 1 ky tu o index 0
str[-3] # tra ve chuoi ky tu co 1 ky tu la ky tu o index str.length-3
str[0..3] # tra ve chuoi tu index 0 den index 3
puts str['str'] # tra ve nil neu str ko chua 'str' co chua tra ve 'str'
puts "%05d" % 123