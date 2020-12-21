require_relative '../lib/file' 
require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/tag') 
require_relative('../lib/test')
require_relative('../lib/end_count')
require_relative('../lib/indentation')
require 'colorize'
class Linter
  extend White_space
  extend Indentation 
  extend Brackets 
  extend Tag 
  extend End_count 
  extend Test
  File_read.new('bin/bug.rb')
end
# Linter.trail_space(File_read.p_file('bin/bug.rb'))
Linter.indent(File_read.p_file('bin/bug.rb')) 
# Linter.try(File_read.p_file('bin/bug.rb'))
Linter.brack(File.readlines('bin/bug.rb'))
Linter.bracket(File.readlines('bin/bug.rb'))
key_word = Linter.end_num 
Linter.end_number(key_word)
# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
