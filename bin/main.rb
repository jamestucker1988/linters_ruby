require_relative '../lib/file' 
require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/indentation')


require 'colorize'
class Linter
  extend White_space
  extend Indentation 
  extend Brackets
  File_read.new('bin/bug.rb')
end
Linter.trail_space(File_read.p_file('bin/bug.rb'))
Linter.indent(File_read.p_file('bin/bug.rb'))
Linter.brack(file.readlines('bin/bug.rb'))

# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
