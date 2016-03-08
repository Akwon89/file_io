require "open-uri"


remote_url = "https://en.wikipedia.org"

remote_data = open(remote_url).read
local_file = File.open("wiki-page.html", "w")

local_file.write(remote_data)
local_file.close

########
require "open-uri"

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
puts open(url).readline

#####

require "open-uri"

url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"

remote_data = open(url).read
local_version = File.open("hamlet.txt", "w")

local_version.write(remote_data)
local_version.close


File.open(local_version, 'r') do |file|
  file.readlines.each_with_index do |line, index|
    puts line if index % 42 == 41
  end
end

#####

####one way

Dir.glob('/Users/andrewkwon/Desktop/*').sort_by{ |filename| File.size(filename) }.reverse[0..9].each do |filename|
  puts "#{filename} has size of #{File.size(filename)}"
end

####second way

sorted = []
Dir.glob('/Users/andrewkwon/Desktop/*').sort_by do |filename|
    sorted << (filename)
end
sorted.reverse[0..9].each do |file|
  puts "#{file} has size of #{File.size(file)}"
end
#####

hash = Dir.glob('/Users/andrewkwon/Desktop/*').inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end

