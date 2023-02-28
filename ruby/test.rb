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


# --------------------------------------------------------------------------------------------------------------------------------------
# string practice
# create a string
str="here is a string.\n"
str1=String.new("here is a string created by using String::new. \n")
str2=String("this is as string. \n")
a="20"
str3 = String.try_convert(a).class #return a new string or nil
puts str3
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
puts (str[0,4]= "hello") # =>'hello' this method return replacement string and str will be modified
puts str #=> 'hello is a string.'
puts str.slice!(0,4) # => 'hell'
puts str # =>'o is a string.'
str[0,4] # tra ve chuoi co 4 ky tu dc cat tu index 0
str[0] # tra ve chuoi co 1 ky tu o index 0
str[-3] # tra ve chuoi ky tu co 1 ky tu la ky tu o index str.length-3
str[0..3] # tra ve chuoi tu index 0 den index 3
puts str['str'] # tra ve nil neu str ko chua 'str' co chua tra ve 'str'

# querying
puts "length of str is #{str.length} charater"
puts "length of str is #{str.size} charater"
puts str.empty? # 'false' if self is not empty,true otherwise
str = "hello world"
puts str.count "lo", "o" # '2' because a.count"lo"=5 "llool".count"o"=2

#substring
puts str.index("l") # '2' this method return index of the first occurence of "l"
puts str.index("lx") # 'nil' this method return nil of not found "lx"
puts str.rindex("l") # '9' this method return index of the last occurence of "l",nil if not found
puts str.include?("l")# 'true' return true if self include "l", "false" otherwise
puts str.match("l").class # Returns a MatchData object if the string matches a given Regexp; nil otherwise.
puts str.match("h",1) # =>'nil' the seach begins at 1
puts str.match?("h") # => "true" match? return true if matched false if not match
puts str.start_with?("he","llo") # =>'true' this method return true if any self begin with any param
puts str.start_with?("wo","llo") # =>'false'
puts str.end_with?("he","ld") # =>'true' this method return true if any self end with any param
puts str.start_with?("wo","llo") # =>'false'

#comparing
puts str=="hello world" # => 'true' 
puts 2 == "2" # =>'false' a numerical string is not directly comparable to an integer value
puts "hello"=="Hello" # => 'false'
puts str.eql?('hello world')
puts str <=> "hello world 1" # => '0' return '-1','0','1' if str<other string,str=other string,str>other string
puts str.casecmp("Hello world") # => '0' return '-1','0','1' ignore case
puts str.casecmp?("Hello world") # => 'true' return true if equal ignore case

#casing
puts str.capitalize!() # upcase fisrt character and downcase other return self
puts str.upcase!() #upcase all characters
puts str.downcase!() #downcase all characters
puts "Hello".to_sym.inspect() # => ':Hello'
puts str.to_sym.inspect() # =>':"hello world"'

# --------------------------------------------------------------------------------------------------------------------------------------
# symbol practice
name=:hanh
name1=:hanh
name2=:hanh
puts name.object_id # =>1203868
puts name1.object_id # =>1203868
puts name2.object_id # =>1203868

name="hanh"
name1="hanh"
name2="hanh"
puts name.object_id # =>60
puts name1.object_id # =>80
puts name2.object_id # =>100

puts Person.class_variables[0].object_id # => 1199948
puts :@@total.object_id # => 1199948

puts Symbol.all_symbols.size() #Symbol.all_symbols return an array has all of current symbols
#has slice,empty?,start_with?,end_with?,length,size,==,<==>,casecmp,casecmp? same sting
puts :hanh[0,2] #slice same string but have not str[] = "" and .slice!
name=:hanh.upcase
puts name.inspect() #=>':HANH'
str=:hanh.to_s # =>'hanh'
puts str.class #=> 'String'

#in hash
employee={
    name:"hanh",
    adress: {
        province: "nam dinh",
        district: "vu ban"
    } 
}
puts employee[:adress][:district] # => 'vu ban'

# --------------------------------------------------------------------------------------------------------------------------------------
# number practice
# ruby has 2 nummeric data type:



#integer
#::sqrt
puts Integer.sqrt(24.1) # =>4
puts Integer.sqrt(25) # =>5
#::try_convert
puts Integer.try_convert(1.25) # => 1
#%
puts 3%2 # =>1
#&
puts 3&2 # =>11&10=10 ~ 2
#*
puts 3*2 # => 6
#**
puts 3**2 # =>9
#+
puts 3+2 # =>5
#-
#-@
#/
#<
#<<
puts 3<<1 # =>'6' time 2
#<=
#<=>
#==
#===
#>
#>=
#>>
puts 3>>1 # => '1' divide 2
#[]
puts ("%04b" % 3)
puts 3[0] # => '1'
puts 3[1] # => '1'
puts 3[2] # => '0'
puts 3[3] # => '0'
#^
#abs
#allbits?
#anybits?
#bit_length
#ceil
#ceildiv
#chr
#coerce
#denominator
#digits
#div
#divmod
#downto
#even?
#fdiv
#floor
#gcd
#gcdlcm
#inspect
#integer?
#lcm
#magnitude
#modulo
#next
#nobits?
#numerator
#odd?
#ord
#pow
#pred
#rationalize
#remainder
#round
#size
#succ
#times
#to_f
#to_i
#to_int
#to_r
#to_s
#truncate
#upto
#zero?
#|
#~

# --------------------------------------------------------------------------------------------------------------------------------------
# hash practice
# hash has certain similar arr but:
#   + array index is a interger
#   + hash key value is any object
phone = Hash.new # => empty hash
phone = Hash[name:1,"price":2,color:3]
phone = {:name => "iphone", "price" => 1000, :color => "white"}
phone = {name: "iphone", "price" => 1000, color: "white"}
puts phone # =>'{:name=>"iphone", "price"=>1000, :color=>"white"}'
puts phone[:name] #=> "iphone"
puts phone["price"] #=> "1000" 
puts phone.key("iphone") #=>"name" return key of value
puts phone.keys.inspect() #=> '[:name, "price", :color]' return list of key
puts phone.values.inspect() #=> '["iphone", 1000, "white"]' return a list of values
puts phone.length() #=> '3' return number of hash elements
phone["price"]=100
puts phone["price"] #=> '100'

# --------------------------------------------------------------------------------------------------------------------------------------
# arr practice
numbers = [1,3,5,7]
names = ["Nam", "Minh", "Long", "Viet"]
mix= [1, 'one', :one, [2, 'two', :two]] 
puts mix.inspect() #=> [1, "one", :one, [2, "two", :two]]
puts names[2] 
names.push("hanh")
names.insert(1,"hieu")