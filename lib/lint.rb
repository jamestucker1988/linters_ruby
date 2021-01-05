# bin/main/env ruby
class Linter
  attr_accessor :file_name
  def initialize(file_name = 'bug.rb')
    @file_name = File.readlines(file_name)
  end

  def bracket
    brack_pair = { '{' => '}', '[' => ']', '(' => ')' }
    arr = []
    file_name.each_with_index do |line, _i|
      line_r = line.split(' ')
      next if line_r.empty?
      line_r.each_with_index do |char, _k|
        char.each_char do |s, _j|
          arr.push(s) if brack_pair.keys.include?(s) || brack_pair.values.include?(s)
        end
      end
      begin
        raise "missing bracket at line #{_i + 1}" if arr.size.odd? && !line_r.empty?
      rescue RuntimeError => e
        puts e.message
      ensure
        arr.clear
      end
    end
   end

  def empty_line1
    c = 0
    file_name.each_with_index do |line, i|
      c += 1 if line.strip.empty?
      begin
        raise "empty line at #{i + 1}" if c > 1
      rescue RuntimeError => e
        puts e.message
      end
      c = 0 if c > 1
    end
 end

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
    puts 'unexpected end-of-input expecting end' if key_count != count
  end

  def trail_space
    file_name.each_with_index do |x, i|
      raise "trailing white_space at  line #{i + 1}" if x.match?(/\s+\n+/)
      raise "trailing white_space at  line #{i + 1} " if x.match?(/\s/) && i == (file_name.size - 1)
    end
  end

  def indent
    puts 'two space of indent to escape indent error'
    cur_indent = 0
    line1_space = 0
    line2_space = 0
    arr1 = res_key
    i = 0
    until    i == file_name.size
      i += 1 while file_name[i].empty?
      obs_indent = (line1_space - line2_space)
      if obs_indent != cur_indent
        puts "indentation error at line  #{i + 1}"
        i += 1
      end
      line1_space = 0
      line2_space = 0
      cur_indent = indent_c(arr1, i + 1) if i < file_name.size - 1
      file_name[i].each_char { |c| c == ' ' ? line2_space += 1 : break } if i < file_name.size - 1
      file_name[i + 1].each_char { |c| c == ' ' ? line1_space += 1 : break } if i < file_name.size - 1
      i == file_name.size ? break : i += 1
    end
  end

  def arrin?(arr1, i)
    arr = %w[def class if unless until case while begin module do]
    1 if arr.include?(arr1[i - 1])
  end

  def arr2in?(arr1, i)
    arr2 = %w[else end elsif]
    1 if arr2.include?(arr1[i - 1]) && arr1[i - 1] != 'end'
  end

  def indent_c(arr1, i)
    c = arrin?(arr1, i), d = arr2in?(arr1, i)
    arr2 = %w[else end elsif]
    cur = if c || d
            2
          elsif arr2.include?(arr1[i]) && !c
            -2
          else
            0
          end
    cur
  end

  def res_key
    i = 0
    arr1 = []
    until file_name.size == i
      res_word1 = file_name[i]
      c = (res_word1.match(/(\s+do\s+)/) ||
      res_word1 .match(/(\s?+\w+\s?)/)) .to_s.strip
      arr1 << (c ? c : ' ')
      i += 1
    end
    arr1
  end
end
lint = Linter.new
lint.indent
lint.bracket
key_word = lint.res_key
lint.end_number(key_word)
lint.empty_line1
lint.trail_space
