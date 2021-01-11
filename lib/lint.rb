# frozen_string_literal: true

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
    file_name.each_with_index do |line, ind|
      arb.clear
      l = line.split(' ')
      brack_block(l, ind, p)
    end
  end

  def brack_block(lin, ind, par)
    lin.each do |char|
      char.each_char do |s|
        arb.push(s) if par.keys.include?(s) || par.values.include?(s)
      end
    end
    r_brack(ind, arb) unless arb.empty?
  end

  def r_brack(ind, arb)
    raise "missing bracket at #{ind + 1}" unless arb.size.even?
  end

  def empty_line1
    c = 0
    file_name.each_with_index do |line, ind|
      c += 1 if line.strip.empty?
      raise "empty line at #{ind + 1}" if c > 1

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
    file_name.each_with_index do |x, ind|
      raise "y trailing white_space at  line #{ind + 1}" if x.match?(/\w+\s+\n/)
    end
  end

  def indent
    arr1 = res_key
    ind = 0
    indent_calc(ind, arr1)
  end

  def indent_call(ind)
    raise "indentation error at line #{ind}" unless f_edit[-1] =~ /^end$/
  end

  def indent_calc(ind, arr1)
    obs = 0
    c = f_edit.size
    until ind == c - 1
      cur = indent_c(arr1, ind)
      raise "indentation error at line #{ind + 1}" if obs != cur

      obs = line_cal(ind)
      ind += 1 if ind < c - 1
    end
    indent_call(c)
  end

  def line_cal(ind)
    line1 = 0
    line2 = 0
    f_edit[ind].each_char { |c| c == ' ' ? line2 += 1 : break }
    f_edit[ind + 1].each_char { |c| c == ' ' ? line1 += 1 : break }
    (line1 - line2)
  end

  def arrin?(arr1, ind)
    arr = %w[def class if unless until case while begin module do]
    1 if arr.include?(arr1[ind - 1])
  end

  def arr2in?(arr1, ind)
    arr2 = %w[else end elsif]
    1 if arr2.include?(arr1[ind - 1]) && arr1[ind - 1] != 'end'
  end

  def indent_c(arr1, ind)
    c = arrin?(arr1, ind)
    d = arr2in?(arr1, ind)
    arr2 = %w[else end elsif]
    if c || d
      2
    elsif arr2.include?(arr1[ind]) && !c
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
      res_word1.match(/(\s?+\w+\s?)/)).to_s.strip
      arr1 << c
      i += 1
    end
    arr1
  end
end
lint = Linter.new
lint.bracket
key_word = lint.res_key
lint.end_number(key_word)
lint.empty_line1
lint.trail_space
lint.indent
