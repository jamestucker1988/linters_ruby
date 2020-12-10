# rubocop:disable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For
class Lint_file
  attr_accessor :file_name
  def initialize(file_name)
    @file_name = file_name 
    puts "check filepath or name"  unless (File.exist?(file_name) || Dir.exist?(file_name))
  end 
#   def p_file 
#     file_read = File.open "#{@file_name}" 
#      file_read.each {|x| puts x}
#   end
# end 
# l = Lint_file.new('bin/bug.rb') 
# l.p_file






# rubocop:enable Metrics/ModuleLength, Metrics/MethodLength, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Style/For