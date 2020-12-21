require_relative('./file') 
module Brackets 
   def bracket(func)
  $brack_pair = {'{'=>'}','['=>']','('=>')'} 
  arr = [] 
  arr1= []
  func.each_with_index do |line,i| 
     line_r = line.split(' ') 
    unless line_r.empty?
    line_r.each_with_index do |char,k| 
   char.each_char do |s,j|  
    arr.push(s)   if ($brack_pair.keys.include?(s) || $brack_pair.values.include?(s)) 
   end 
  end 
  puts "missing bracket" if arr.size%2 !=0 && !line_r.empty?.red
   arr.clear
  end
end
end 
end

 

