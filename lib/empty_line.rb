module Empty_line1
  def empty_line1(func)
    c = 0
    func.each_with_index do |line, i|
      c += 1 if line.strip.empty?
      if c > 1
        puts "empty line at #{i + 1}"
        c = 0
      end
    end
    end
  end
