require_relative('./file')
module Empty_line1
  def empty_line1(func)
    func.each_with_index do |line, i|
      puts "empty line at #{i + 1}".red if line.strip.empty?
    end
  end
end
