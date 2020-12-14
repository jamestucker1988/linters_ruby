require_relative('./file') 
module Brackets 
   def brack(func)
  brack_pair = {'{'=>'}','['=>']','('=>')'} 
  arr = [] 
  arr1= []
  func.each_with_index do |line,i| 
     line_r = line.split(' ') 
    unless line_r.empty?
    line_r.each_with_index do |char,k| 
      puts char
   char.each_char do |s,j|  
    if brack_pair.keys.include?(s) || brack_pair.values.include?(s) 
      arr.push(s) 
    end 
   end
  end 
  puts "missing bracket at line #{i+1}".red if arr.size%2 !=0 && !line_r.empty? 
  arr.clear
end
end
end
end
