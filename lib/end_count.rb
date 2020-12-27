require_relative('./file')
module End_count1
  def end_number(keyword)
    arr = %w[def class if unless until case while begin module do]
    count = 0
    key_count = 0
    keyword.each do |key|
      if key == 'end'
        count += 1
      elsif  arr.include?(key)
        key_count += 1
      end
    end
    puts 'unexpected end-of-input expecting end'.blue if key_count != count
  end
end
