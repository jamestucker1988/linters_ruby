# require_relative('./white_space')
# include White_space
class File_read
  attr_accessor :file_name
  def initialize(file_name)
    @file_name = file_name
    puts 'check filepath or name' unless File.exist?(file_name) || Dir.exist?(file_name)
  end

  def self.p_file(file_name)
    File.readlines file_name
  end
end
