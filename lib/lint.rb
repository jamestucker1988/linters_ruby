# bin/main/env ruby
class Linter
  attr_accessor :file_name, :new_file, :line2, :line1, :arb
  def initialize(file_name = 'bug.rb')
    @file_name = File.readlines(file_name)
    @arb = []
  end

  def f_edit
    @new_file = []
    file_name.each { |x| new_file << x if x.gsub(/^\s+$/, ' ') }
    new_file
  end

  def bracket
    p = { '{' => '}', '[' => ']', '(' => ')' }
    file_name.each_with_index do |line, i|
      arb.clear
      l = line.split(' ')
      brack_block(l, i, p)
    end
  end

  def brack_block(l, i, p)
    l.each do |char|
      char.each_char do |s|
        arb.push(s) if p.keys.include?(s) || p.values.include?(s)
      end
    end
    r_brack(i, arb) unless arb.empty?
  end

  def r_brack(i, arb)
    raise "missing bracket at #{i + 1}" unless arb.size.even?
  end

  def empty_line1
    c = 0
    file_name.each_with_index do |line, i|
      c += 1 if line.strip.empty?
      raise "empty line at #{i + 1}" if c > 1
      c = 0 if c > 1
    end
  end

  def end_number(keyword)
    arr = %w[def class if unless until case while begin module do]
    count = 0
    key_count = 0
    keyword.each do |key|
      count += 1 if key == 'end'
      key_count += 1 if arr.include?(key)
    end
    raise 'unexpected end-of-input expecting end' if key_count != count
  end

  def trail_space
    file_name.each_with_index do |x, i|
      raise "y trailing white_space at  line #{i + 1}" if x.match?(/\w+\s+\n/)
    end
  end

  def indent
    arr1 = res_key
    i = 0
    indent_calc(i, arr1)
  end

  def indent_call(c)
    raise "indentation error at line #{c - 1}" unless f_edit[-1] =~ /^end$/
  end

  def indent_calc(i, arr1)
    obs = 0
    c = f_edit.size
    until i == c - 1
      cur = indent_c(arr1, i).abs
      raise "indentation error at line  #{i + 1}" if obs != cur
      obs = line_cal(i)
      i += 1 if i < c - 1
    end
    indent_call(c)
  end

  def line_cal(i)
    line1 = 0
    line2 = 0
    f_edit[i].each_char { |c| c == ' ' ? line2 += 1 : break }
    f_edit[i + 1].each_char { |c| c == ' ' ? line1 += 1 : break }
    (line2 - line1).abs
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
    c = arrin?(arr1, i)
    d = arr2in?(arr1, i)
    arr2 = %w[else end elsif]
    if c || d
      2
    elsif arr2.include?(arr1[i]) && !c
      -2
    else
      0
    end
  end

  def res_key
    i = 0
    arr1 = []
    until file_name.size == i
      res_word1 = file_name[i]
      c = (res_word1.match(/(\s+do\s+)/) ||
      res_word1 .match(/(\s?+\w+\s?)/)) .to_s.strip
      arr1 << c
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
