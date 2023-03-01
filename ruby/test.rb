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
h1={a:1,b:2,c:3}

# Setting Hash State
# compare_by_identity: Sets self to consider only identity in comparing keys.
s0 = 'x'
s1 = 'x'
h = {}
h.compare_by_identity # => {}
puts h.compare_by_identity? # => true
h[s0] = 0
h[s1] = 1
h # => {"x"=>0, "x"=>1}
# default=: Sets the default to a given value.
counts = {foo: 42}
counts.default # => nil (default)
counts[:foo] = 42
counts[:bar] # => nil
counts.default = 0
counts[:bar] # => 0
counts.values_at(:foo, :bar, :baz) # => [42, 0, 0]
counts.dig(:bar) # => 0
# default_proc=: Sets the default proc to a given proc.
# rehash: Rebuilds the hash table by recomputing the hash index for each key.
a0 = [ :foo, :bar ]
a1 = [ :baz, :bat ]
h = {a0 => 0, a1 => 1}
h.include?(a0) # => true
h[a0] # => 0
a0.hash # => 110002110
a0[0]=:baz
puts h[a0] #=> nil
h.rehash
puts h[a0] #=> 0

# Querying
# any?: Returns whether any element satisfies a given criterion.
puts phone.any? #=> true
puts phone.any?([:name,"iphone"]) #=> true
puts phone.any? {|key,value| key.is_a? Symbol} #=> true
# compare_by_identity?: Returns whether the hash considers only identity when comparing keys.
h={}
k1='x'
k2='x'
h.compare_by_identity?
h[k1]=0
h[k2]=1
puts h.inspect #=> {1=>1}
h.compare_by_identity
puts h.compare_by_identity?
h[k1]=0
h[k2]=1
puts h.inspect
# default: Returns the default value, or the default value for a given key.
counts = {foo: 42}
counts.default # => nil (default)
counts[:foo] = 42
counts[:bar] # => nil
counts.default = 0
counts[:bar] # => 0
counts.values_at(:foo, :bar, :baz) # => [42, 0, 0]
counts.dig(:bar) # => 0
# default_proc: Returns the default proc.
# empty?: Returns whether there are no entries.
puts phone.empty? #=> false
# eql?: Returns whether a given object is equal to self.
h1 = {foo: 0, bar: 1, baz: 2}
h2 = {foo: 0, bar: 1, baz: 2}
h1.eql? h2 # => true
h3 = {baz: 2, bar: 1, foo: 0}
h1.eql? h3 # => true
# hash: Returns the integer hash code.
# Two Hash objects have the same hash-code if their content is the same (regardless or order):
h1 = {foo: 0, bar: 1, baz: 2}
h2 = {baz: 2, bar: 1, foo: 0}
h2.hash == h1.hash # => true
h2.eql? h1 # => true
# has_value?: Returns whether a given object is a value in self.
puts h1.value?(1) #=> true

# include?, has_key?, member?, key?: Returns whether a given object is a key in self.

# length, size: Returns the count of entries.

# value?: Returns whether a given object is a value in self.
# --------------------------------------------------------------------------------------------------------------------------------------
# arr practice
numbers = [1,3,5,7]
names = ["Nam", "Minh", "Long", "Viet"]
mix= [1, 'one', :one, [2, 'two', :two]] 
temp=[1,nil,2]
puts mix.inspect() #=> [1, "one", :one, [2, "two", :two]]
puts names[2] 
names.push("hanh")
names.insert(1,"hieu")

# Querying
# length, size: Returns the count of elements.
puts names.length #=> '6'
# include?: Returns whether any element == a given object.
puts names.include?('hanh') #=>true
# empty?: Returns whether there are no elements.
a=[]
puts a.empty? #=>true
puts name.empty? #=> false
# all?: Returns whether all elements meet a given criterion.
puts names.all? #=> true
puts temp.all? #=> false
puts names.all? {|el| el.is_a? String} #=> true
puts names.all?("hanh") #=> false
# any?: Returns whether any element meets a given criterion.
puts temp.any? #=> true
puts numbers.any? {|el| el<=1} #=>true
puts names.any?("hanh") #=> true
# none?: Returns whether no element == a given object.
puts [nil,false].none? #=> true
puts [0, 1, 2].none? {|element| element > 3 } # => true
puts [0, 1, 2].none?(3)# => true
# one?: Returns whether exactly one element == a given object.
puts [nil,1].one? #=> true
puts [nil,1,2].one? #=> false
puts [1,2,3].one? {|el| el>2} #=> true
# count: Returns the count of elements that meet a given criterion.
puts numbers.count #=> 4
puts [nil,1].count #=> 4
puts numbers.count(1) #=> 1
puts numbers.count {|el| el>1} #=> 3
# find_index, index: Returns the index of the first element that meets a given criterion.
puts numbers.index.inspect #=> #<Enumerator: [1, 3, 5, 7]:index>
puts numbers.index(3) #=> 1
puts numbers.index {|el| el>3} #=> 2
# rindex: Returns the index of the last element that meets a given criterion.
puts numbers.rindex.inspect #=> #<Enumerator: [1, 3, 5, 7]:index>
puts [1,1,2].rindex(1) #=> 1
puts numbers.rindex {|el| el>3} #=> 3

#Comparing
#<=>: Returns -1, 0, or 1 * as self is less than, equal to, or greater than a given object.
puts [1,2,3]<=>[3,2,1] #=> -1
puts [1,2,3]<=>[[1,2],2,3] #=> nil
puts [1,2,3]<=>[1,1,[1,2]] #=> 1
puts [1,2,[1,2]]<=>[1,2,[1,2]] #=> 0
# ==: Returns whether each element in self is == to the corresponding element in a given object.
puts [1,2,3]==[3,2,1] #=> false
puts [1,2,3]==[1,2,3] #=> true


#Fetching
# []: Returns one or more elements.
puts numbers[0] #=> 1
puts numbers[-1] #=> 7
puts numbers[0,2] #=>[1,3]
puts numbers[-1,2] #=>[7]
puts numbers[0..2] #=>[1,3,5]

# fetch: Returns the element at a given offset.
puts numbers.fetch(1) #=> 3
puts numbers.fetch(5,"hello")
puts numbers.fetch(5) {|i| "#{i}"}
# first: Returns one or more leading elements.
[].first #=> nil
numbers.first #=> 1
numbers.first(2) #=> 1,3
puts numbers.first(6).inspect #=> [1,3,5,7]
# last: Returns one or more trailing elements.
numbers.last #=> 7
numbers.last(2) #=> 5,7
puts numbers.last(6).inspect #=> [1,3,5,7]
# max: Returns one or more maximum-valued elements, as determined by <=> or a given block.
puts [[0],[1],[2]].max.inspect #=> [2]
puts [0,1,2].max(2).inspect #=> [2,1]
puts numbers.max {|a,b| a<=>b}
# min: Returns one or more minimum-valued elements, as determined by <=> or a given block.
#same max
# minmax: Returns the minimum-valued and maximum-valued elements, as determined by <=> or a given block.
puts numbers.minmax #=>[1,7]
# assoc: Returns the first element that is an array whose first element == a given object.
a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
a.assoc(4) # => [4, 5, 6]
# rassoc: Returns the first element that is an array whose second element == a given object.
a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
a.rassoc(4) # => [2, 4]
# at: Returns the element at a given offset.
puts numbers.at(0) #=> '1'
# values_at: Returns the elements at given offsets.
numbers.values_at(0) #=> 1
numbers.values_at(0,2) #=> 1,5
numbers.values_at(0..2) #=> 1,3,5
numbers.values_at(0,0) #=> 1,1
# dig: Returns the object in nested objects that is specified by a given index and additional arguments.
a = [:foo, [:bar, :baz, [:bat, :bam]]]
puts a[1][2][1]
# drop: Returns trailing elements as determined by a given index.
a = [0, 1, 2, 3, 4, 5]
puts a.drop(0).inspect # => [0, 1, 2, 3, 4, 5]
puts a.drop(1).inspect # => [1, 2, 3, 4, 5]
puts a.drop(2).inspect # => [2, 3, 4, 5]
# take: Returns leading elements as determined by a given index.
a = [0, 1, 2, 3, 4, 5]
a.take(1) # => [0]
a.take(2) # => [0, 1]
a.take(50) # => [0, 1, 2, 3, 4, 5]
a # => [0, 1, 2, 3, 4, 5]
# drop_while: Returns trailing elements as determined by a given block.
a = [0, 1, 2, 3, 4, 5]
puts a.drop_while {|el| el<2} # => [ 2, 3, 4, 5]
# take_while: Returns leading elements as determined by a given block.
puts a.drop_while {|el| el<2} # => [ 0, 1]
# slice: Returns consecutive elements as determined by a given argument.
# same []
# sort: Returns all elements in an order determined by <=> or a given block.
a=[1,4,2,3,5]
b=a.sort 
puts b.inspect #=> [1, 2, 3, 4, 5]
# reverse: Returns all elements in reverse order.
a=[1,4,2,3,5]
b=a.reverse
puts b.inspect #=> [5,3,2,4,1]
# compact: Returns an array containing all non-nil elements.
a = [nil, 0, nil, 1, nil, 2, nil]
a.compact # => [0, 1, 2]
# select, filter: Returns an array containing elements selected by a given block.
a = [:foo, 'bar', 2, :bam]
a1 = a.select {|element| element.to_s.start_with?('b') }
a1 # => ["bar", :bam]
a.select # => #<Enumerator: [:foo, "bar", 2, :bam]:select>
# uniq: Returns an array containing non-duplicate elements.
a = [1,1,2,3,1,3]
puts a.uniq.inspect
# rotate: Returns all elements with some rotated from one end to the other.
a = [:foo, 'bar', 2, 'bar']
a1 = a.rotate
a1 # => ["bar", 2, "bar", :foo]
# bsearch: Returns an element selected via a binary search as determined by a given block.
# bsearch_index: Returns the index of an element selected via a binary search as determined by a given block.
# sample: Returns one or more random elements.
puts names.sample.inspect
puts names.sample(3).inspect
# shuffle: Returns elements in a random order.
a = [1, 2, 3] #=> [1, 2, 3]
a.shuffle!     #=> [2, 3, 1]
puts a             #=> [1, 2, 3]
# Assigning
# []=: Assigns specified elements with a given object.
numbers[0]=2
puts numbers.inspect #=> [2, 3, 5, 7]
numbers[0,0]=2
puts numbers.inspect #=> [2,2,3,5,7]
numbers[0,2]=[1,2]
puts numbers.inspect #=>[1,2,3,5,7]
a = [:foo, 'bar', 2]
a[6, 50] = 'foo' # => "foo"
puts a.length # => [:foo, "bar", 2, nil, nil, nil, "foo"]
# push, append, <<: Appends trailing elements.
numbers.push(9,10)
numbers.push([9,10])
puts numbers.inspect #=>[1, 2, 3, 5, 7, 9, 10, [9, 10]]
# unshift, prepend: Prepends leading elements.
# insert: Inserts given objects at a given offset; does not replace elements.
# concat: Appends all elements from given arrays.
a = [0, 1]
a.concat([2, 3], [4, 5]) # => [0, 1, 2, 3, 4, 5]
puts a.inspect #=> [0, 1, 2, 3, 4, 5]
# fill: Replaces specified elements with specified objects.
a = ['a', 'b', 'c', 'd']
a.fill(:X, -10, 1) # => [:X, "b", "c", "d"]
puts a.inspect
# replace: Replaces the content of self with the content of a given array.
a=[1,2,3,4]
puts a.replace(["hanh",1,2]).inspect #=>["hanh", 1, 2]


# Deleting
# pop: Removes and returns the last element.
# shift: Removes and returns the first element.
a=[1,2,3,4]
puts a.pop #=> 4
puts a.pop(2) #=> [2,3]
puts a #=> 1
# compact!: Removes all nil elements.

# delete: Removes elements equal to a given object.
s1 = 'bar'; s2 = 'bar'
a = [:foo, s1, 2, s2]

puts deleted_obj = a.delete('bar')
puts a # => [:foo, 2]
# delete_at: Removes the element at a given offset.
a=[1,2,3,5]
a.delete_at(3)
puts a
# delete_if: Removes elements specified by a given block.
a=[1,2,3,5]
a.delete_if {|el| el>3}
# keep_if: Removes elements not specified by a given block.
# reject!: Removes elements specified by a given block.
a=[1,2,3,5]
a.reject! {|el| el>3}
puts a #=> [1,2,3]
# select!, filter!: Removes elements not specified by a given block.
a=[1,2,3,5]
a.select! {|el| el>3}
puts a #=>[5]
# slice!: Removes and returns a sequence of elements.
a=[1,2,3,5]
a.slice!(1,2)
puts a.inspect #=>[1,5]
# uniq!: Removes duplicates.
a=[1,1,2,1,3]
puts a.uniq!.inspect
puts a.inspect

# Combining
# &: Returns an array containing elements found both in self and a given array.
a1="hanh".chars
a2="hieu".chars
puts (a1&a2).inspect
# intersection: Returns an array containing elements found both in self and in each given array.
[0, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) # => [0, 1]
[0, 0, 1, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) # => [0, 1]
# +: Returns an array containing all elements of self followed by all elements of a given array.
puts (a1+a2).inspect #=> ["h", "a", "n", "h", "h", "i", "e", "u"]
# -: Returns an array containing all elements of self that are not found in a given array.
puts (a1-a2).inspect #=> ["a", "n"]
# |: Returns an array containing all elements of self and all elements of a given array, duplicates removed.
puts (a1|a2).inspect #=> ["h", "a", "n", "i", "e", "u"]
# union: Returns an array containing all elements of self and all elements of given arrays, duplicates removed.
# difference: Returns an array containing all elements of self that are not found in any of the given arrays..
# product: Returns or yields all combinations of elements from self and given arrays.


# Iterating
# each: Passes each element to a given block.
a=[1,2,3,4]
puts a.each {|el| puts el}.inspect
# reverse_each: Passes each element, in reverse order, to a given block.
# each_index: Passes each element index to a given block.
a=[1,2,3,4]
puts a.each_index {|el| puts el}.inspect
# cycle: Calls a given block with each element, then does so again, for a specified number of times, or forever.

# combination: Calls a given block with combinations of elements of self; a combination does not use the same element more than once.

# permutation: Calls a given block with permutations of elements of self; a permutation does not use the same element more than once.

# repeated_combination: Calls a given block with combinations of elements of self; a combination may use the same element more than once.

# repeated_permutation: Calls a given block with permutations of elements of self; a permutation may use the same element more than once.

for i in 1..9
    for j in 1..10
        puts "#{i}x#{j}=#{i*j}"
    end
end
(1..9).each do |i|
    (1..10).each do |j|
        puts "#{i}x#{j}=#{i*j}"
    end
end

# cach 1
  def group_by_owners(files)
    a=files.flatten
      f={}
      i = -1
    loop do
        i += 2
        if !f[a[i]]
          f[a[i]]=[]
        end
        f[a[i]]<<a[i-1]
        if i == a.length-1
            break
        end
    end
      return f
  end
# cach 2
def group_by_owners(files)
    f={}
    files.each{|key,value| 
    if !f[value]
        f[value]=[]
    end
    f[value]<<key
    }
    return f
  end
  files = {
    'Input.txt' => 'Randy',
    'Code.py' => 'Stan',
    'Output.txt' => 'Randy'
  }
  puts group_by_owners(files)


# --------------------------------------------------------------------------------------------------------------------------------------
# coditional practice

a=10
# if
if a==10
    puts "a = 10"
end
# if else
if a>2
    puts "a>2"
else
    puts "a<=2"
end
#if elsif
if a>2
    puts "a>2"
elsif a>-1
    puts "a>-1"
else
    puts "a<-1"
end

#unless
my_age=22
unless my_age>27
    puts "toi con tre"
else
    puts "toi da gia"
end
# case when
today=3
schedule =case today
    when 0,7
        "nghi"
    when 1,2,3,4,5
        "lam viec"
    when 6
        "di choi"
    end
puts "hom nay toi #{schedule}"
# ?:
def is_odd(n)
    return n%2==1?true:false
end
puts is_odd(2)


# --------------------------------------------------------------------------------------------------------------------------------------
# loop practice

#while
a=[]
i = 0
while i < 5 do
   a<<i
   i += 1
   break if i==3
end
puts a.inspect

#until
a=[]
i = 0
until i == 5 do
   a<<i
   i += 1
end
puts a.inspect

# #for
# for i in 1..9
#     for j in 1..10
#         puts "#{i}*#{j}=#{i*j}"
#     end
# end

# times
9.times{|i| 10.times{|j| puts "#{i+1}*#{j+1}=#{(i+1)*(j+1)}" }}

# --------------------------------------------------------------------------------------------------------------------------------------
# iterators practice

# each
names=["hanh","hieu","dat"]
i=0
a=names.each do |name|
    puts "ten nguoi thu #{i+=1} ten la #{name}"
end
# puts a

# map
a=names.map do |name|
    "ten nguoi thu #{i+=1} ten la #{name}"
end
# puts a

#select
names=["hanh","hieu","dat"]
a=names.select do |name|
    name.start_with?('b')
end
puts a

#inject
puts (1..4).inject(:-) #=> -8
# Sum of squares, without initial_operand.
a=(1..4).to_a
b=a.inject {|sum, n| sum + n*n } 
puts b
# Sum of squares, with initial_operand.
(1..4).inject(2) {|sum, n| sum + n*n } # => 32
puts (1..4).inject {|vol, n| vol*n } # => 24

#detect
puts (1..4).detect {|n| n>2} #=> 3
