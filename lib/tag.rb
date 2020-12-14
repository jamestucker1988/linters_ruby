require_relative('./file') 
module Tag
def brack(func)
  func.each_with_index do |line,i| 
unless line.empty?
    reg1 = /.*[)|\]].*/
    reg = /.*[(|\[].*[)|\]].*/
    reg2 = /.*[}].*/ 
    reg3 = /.*({).*}.*/ 
    # reg4 =  /.*[(|\[].*/ 
    reg5 = /.*[{].*/ 
    reg6 = /.*(}).*}.*/ 
    puts "missing-token  at line #{i += 1}".red if !reg.match?(line) && reg1.match?(line)
    puts "missing-token  at line #{i += 1}".red if !reg3.match?(line) && reg2.match?(line) 
    puts "missing-token  at line #{i += 1}".red if !reg3.match?(line) && reg2.match?(line)
    puts "missing-token  at line #{i += 1}".red if !reg6.match?(line) && reg5.match?(line)
end
end
end
end
