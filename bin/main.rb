#!usr/bin/env ruby
require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/end_count')
require_relative('../lib/empty_line')
require_relative('../lib/indentation')
# class
class Linter
  attr_accessor :file_name
  include White_space
  include Indentation
  include Brackets
  include End_count1
  include Empty_line1 
  def input_file_name 
    puts "enter file_path or name"
    @file_name =  gets.chomp
  end
end
lint = Linter.new 
file_name = lint.input_file_name
lint.indent(File.readlines("#{file_name}"))
lint.bracket(File.readlines("#{file_name}"))
key_word = lint.end_num
lint.end_number(key_word)
lint.empty_line1(File.readlines("#{file_name}"))
