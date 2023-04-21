# gendoc.rb -- Converts the top-comments inside module.c to modules API
#              reference documentation in markdown format.

# Convert the C comment to markdown
def markdown(s)
  s = s.gsub(%r{\*/$}, "")
  s = s.gsub(/^ \* {0,1}/, "")
  s = s.gsub(%r{^/\* }, "")
  s.chop! while s[-1] == "\n" || s[-1] == " "
  lines = s.split("\n")
  newlines = []
  lines.each do |l|
    if l[0] != ' '
      l = l.gsub(/RM_[A-z()]+/) { |x| "`#{x}`" }
      l = l.gsub(/RedisModule_[A-z()]+/) { |x| "`#{x}`" }
      l = l.gsub(/REDISMODULE_[A-z]+/) { |x| "`#{x}`" }
    end
    newlines << l
  end
  newlines.join("\n")
end

# Given the source code array and the index at which an exported symbol was
# detected, extracts and outputs the documentation.
def docufy(src, i)
  m = /RM_[A-z0-9]+/.match(src[i])
  name = m[0]
  name = name.sub("RM_", "RedisModule_")
  proto = "#{src[i].sub('{', '').strip};\n"
  proto = proto.sub("RM_", "RedisModule_")
  puts "## `#{name}`\n\n"
  puts "    #{proto}\n"
  comment = ""
  loop do
    i -= 1
    comment = src[i] + comment
    break if src[i] =~ %r{/\*}
  end
  comment = markdown(comment)
  puts "#{comment}\n\n"
end

puts "# Modules API reference\n\n"
src = File.open("../module.c").to_a
src.each_with_index do |line, i|
  next unless line =~ /RM_/ && line[0] != ' ' && line[0] != '#' && line[0] != '/'

  docufy(src, i) if src[i - 1] =~ %r{\*/}
end
