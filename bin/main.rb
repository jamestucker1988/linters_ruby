require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/end_count')
require_relative('../lib/empty_line')
require_relative('../lib/indentation')
 require 'colorize' 
class Linter
  include White_space
  include Indentation
  include Brackets
  include End_count1
  include Empty_line1
end
lint = Linter.new
lint.indent(File.readlines('lib/bug.rb'))
lint.bracket(File.readlines('lib/bug.rb'))
key_word = lint.end_num
lint.end_number(key_word)
lint.empty_line1(File.readlines('lib/bug.rb'))
# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
