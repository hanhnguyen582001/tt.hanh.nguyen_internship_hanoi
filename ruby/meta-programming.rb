# eval
# eval sẽ thực thi đoạn code được truyền vào hàm dưới dạng string
puts eval("7  * 6") # 42

eval("def sum(a, b); a + b; end")
puts sum(1, 2) # 3

# 2. instance_eval
# instance_eval dùng để khai báo thêm class method cho class
String.instance_eval do
  def some_class_method
    puts "some_class_method is called"
  end
end

String.some_class_method # some_class_method is called

# 3. class_eval
# class_eval dùng để khai báo thêm instance method cho class
String.class_eval do
  def some_instance_method
    puts self.upcase
  end
end

"Hello world".some_instance_method # HELLO WORLD

# 4. define_method
# define_method được dùng để định nghĩa method của 1 class
# Trong trường hợp 1 class có nhiều method có xử lý tương tự nhau, chỉ khác nhau ở tên hoặc 1 số chi tiết nhỏ khác, define method được sử dụng để giữ cho code được DRY hơn.
class Developer
  ROLES = [:front_end, :back_end, :dev_ops]
  SKILLS = { front_end: ["html", "css", "js"],
             back_end: ["Ruby", "MySQL", "Rails"] }

  ROLES.each do |role|
    define_method "#{role}_developer" do
      puts "Learning #{SKILLS[role].join(", ")}"
    end
  end
end

Developer.new.front_end_developer

# 5. method_missing
# method_missing là method được gọi khi gọi đến 1 method chưa được define
# Khi method_missing của class chưa được defind, method_missing của class cha (class Object) sẽ được gọi và raise lỗi NoMethodError
# 3.0.0 :001 > "hello world".demo
# Traceback (most recent call last):
#         4: from /home/le.tan.thanh/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `<main>'
#         3: from /home/le.tan.thanh/.rvm/rubies/ruby-3.0.0/bin/irb:23:in `load'
#         2: from /home/le.tan.thanh/.rvm/rubies/ruby-3.0.0/lib/ruby/gems/3.0.0/gems/irb-1.3.0/exe/irb:11:in `<top (required)>'
#         1: from (irb):1:in `<main>'
# NoMethodError (undefined method `demo' for "hello world":String)

# Bạn có thể định nghĩa method_missing cho class như sau
String.class_eval do
  def method_missing(method, *args, &block)
    puts "Method #{method} is called with #{args} "
  end
end

"hello world".demo(1, 2, 3) # Method demo is called with [1, 2, 3]

# 6. remove_method:
# remove_method được dùng để remove method ra khỏi class
# Method đã được remove sẽ raise lỗi NoMethodError khi được gọi
puts "hello world".upcase
String.remove_method(:upcase)
puts "hello world".upcase

class MyError < StandardError
  attr_reader :thing

  def initialize(message = "My default message", thing = "apple")
    @thing = thing
    super(message)
  end
end
 raise MyError ("my message", "my thing")
