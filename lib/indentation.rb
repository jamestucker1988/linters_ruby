#!usr/bin/env ruby
module Indentation
  def indent(func)
    $arr = []
    $arr1 = []
    puts 'two space of indent to escape indent error'
    cur_indent = 0
    line1_space = 0
    line2_space = 0
    res_key(func)
    $i = 0
    until   func.size == $i
      $i += 1 while func[$i].empty?
      obs_indent = (line2_space - line1_space)
      if obs_indent != cur_indent
        puts "indentation error at line  #{$i} #{cur_indent} #{line1_space},#{line2_space} "
      end
      line1_space = 0
      line2_space = 0
      func[$i - 1].each_char { |c| c == ' ' ? line1_space += 1 : break }
      func[$i].each_char { |c| c == ' ' ? line2_space += 1 : break } unless func.size - 1 == $i
      cur_indent = indent_c
      $i += 1
    end
  end

  def indent_c
    arr = %w[def class if unless until case while begin module do]
    arr2 = %w[else end elsif]
    if arr.include?($arr1[$i - 1]) || (arr2.include?($arr1[$i - 1]) && $arr1[$i - 1] != 'end')
      cur_indent = 2
    elsif arr2.include?($arr1[$i]) && !arr.include?($arr1[$i - 1])
      cur_indent = -2
    else
      cur_indent = 0
    end
    cur_indent
  end

  def res_key(func)
    $i = 0
    until func.size == $i
      res_word1 = func[$i]
      c = (res_word1.match(/(\s+do\s+)/) || res_word1 .match(/(\s?+\w+\s?)/)) .to_s.strip
      $arr1 << (c ? c : ' ')
      $i += 1
    end
  end

  def end_num
    $arr1
  end
end
