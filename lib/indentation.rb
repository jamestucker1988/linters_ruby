require_relative('./file')
module Indentation
  def indent(func)
    puts 'two space of indent to escape indent error'.yellow
    cur_indent = 0
    c = 1
    $i = 1
    line1_space = 0
    line2_space = 0
    until func.size < 2
      first_line_res_word = func[0].split(' ')
      last_line_res_word = func[1].split(' ')
      func[0].each_char { |c| c == ' ' ? line1_space += 1 : break }
      func[1].each_char { |c| c == ' ' ? line2_space += 1 : break }
      cur_indent = indent_expected(line1_space, line2_space, cur_indent, first_line_res_word, last_line_res_word)
      func.slice!(0, 1)
      observed_indent = (line2_space - line1_space).abs
      if observed_indent != cur_indent
        puts "indentation error at line  #{$i += 1}" .red
        c = 0
      end
    end
    puts 'no indentation error in file'.green unless c.zero?
  end
  private
  def indent_expected(_line1_space, _line2_space, cur_indent, first_line_res_word, last_line_res_word)
    keyword = %w[def class if unless do case while begin]
    if keyword.include?(first_line_res_word.first) && (first_line_res_word.first != first_line_res_word.last)
      cur_indent += 4
    elsif  !keyword.include?(first_line_res_word.first) && !keyword.include?(first_line_res_word.last) && last_line_res_word.first == 'end' && cur_indent.positive?
      cur_indent -= 4
    elsif  first_line_res_word[-1] == 'do' || first_line_res_word[-2] == 'do'
      cur_indent += 4
    elsif first_line_res_word.first == first_line_res_word.last && first_line_res_word.first == 'elsif'
      cur_indent += 4
    elsif keyword.include?(first_line_res_word.first) && (first_line_res_word.first != first_line_res_word.last) && cur_indent.positive?
      cur_indent -= 4
    end
    cur_indent
  end
end
