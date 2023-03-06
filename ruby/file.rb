# Access Modes
# Methods File.new and File.open each create a File object for a given file path.

# Read/Write Modes for Existing File

# |------|-----------|----------|----------|----------|-----------|
# | R/W  | Initial   |          | Initial  |          | Initial   |
# | Mode | Truncate? |  Read    | Read Pos |  Write   | Write Pos |
# |------|-----------|----------|----------|----------|-----------|
# | 'r'  |    No     | Anywhere |    0     |   Error  |     -     |
# | 'w'  |    Yes    |   Error  |    -     | Anywhere |     0     |
# | 'a'  |    No     |   Error  |    -     | End only |    End    |
# | 'r+' |    No     | Anywhere |    0     | Anywhere |     0     |
# | 'w+' |    Yes    | Anywhere |    0     | Anywhere |     0     |
# | 'a+' |    No     | Anywhere |   End    | End only |    End    |
# |------|-----------|----------|----------|----------|-----------|

# Read/Write Modes for \File To Be Created

# |------|----------|----------|----------|-----------|
# | R/W  |          | Initial  |          | Initial   |
# | Mode |  Read    | Read Pos |  Write   | Write Pos |
# |------|----------|----------|----------|-----------|
# | 'w'  |   Error  |    -     | Anywhere |     0     |
# | 'a'  |   Error  |    -     | End only |     0     |
# | 'w+' | Anywhere |    0     | Anywhere |     0     |
# | 'a+' | Anywhere |    0     | End only |    End    |
# |------|----------|----------|----------|-----------|

#File.new
#
path = "temp.txt"
file = File.new("temp.txt", "w+")
puts file.pos
# Writes each of the given objects to self, which must be opened for writing (see Access Modes); 
# returns the total number bytes written; each of objects that is not a string is converted via method to_s:
file.write("Hello every one my name is hanh." ,"Im ", 22, " years old. ") #
file.puts("Im a intern ruby in tomosia.")
file << "this is ruby\n"
file << ""
file.flush #because the file is buffered mode need push data in buffer to storage
a = File.read(path)
puts a
file.puts("hello again")
file.flush #because the file is buffered mode need push data in buffer to storage
puts file.gets()

File.open(path) do |file|
puts file.gets()
p file.gets(nil)
end

#file.exists
puts File.exist?(path)
#file rename
File.rename path,"temp.txt"
#read a file and print all sentence ending with .
if(File.exist? path)
    File.open(path) do |file|
        while(line=file.gets("."))
            puts line.strip
        end
    end
end
#
file=File.open("../global.css")
puts file.gets

#----------------------------------------------------------------------------------------------------------------------------------------------------
#directory
unless(Dir.exist? "temp")
    puts Dir.mkdir('temp') #=> create directory temp
end
Dir.chdir("temp") #=> cd to temp
file=File.open("test.txt","w") #create a file in dir temp
file.close
puts File.exist? "./test.txt" # check for existence of test.txt
puts Dir.pwd #=> path of curent direc
File.delete('test.txt')
Dir.chdir("..")
Dir.rmdir "temp"
puts Dir.exist? "temp"