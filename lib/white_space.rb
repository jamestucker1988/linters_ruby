require_relative('./file')
module White_space
  def trail_space(func)
    count = 0
    func.each do |x|
      c = x.to_s
      count += 1
      case count
      when count < c.length
        puts "trailing white_space at  line #{count} " if c.match?(/[\s]+\n/) 
      end
      when count  ==  c.length
        puts "trailing white_space at  line #{count} "  if c.match?(/\s/)
      end
    end
  end
end
