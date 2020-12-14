require_relative('./file') 
module Tag
def brack(func)
  brack_pair = {'{'=>'}','['=>']','('=>')'} 
  arr = [] 
  arr1= []
  func.each_with_index do |line,i| 
    #  line_r = line.split(' ') 
    # puts line
unless line.empty?
    reg1 = /.*[)].*/
    reg = /.*[(].*[)].*/
    puts "missing-tag ( at line #{i += 1}" if !reg.match?(line) && reg1.match?(line)

end
end
end
end
