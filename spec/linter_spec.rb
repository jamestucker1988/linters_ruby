require_relative ('../bin/main')
require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/end_count')
require_relative('../lib/empty_line')
require_relative('../lib/indentation') 
require 'colorize'  

describe 'class Linters' do
 let(:l)  {Linter.new}  
specify{expect(l).to be_an_instance_of(Linter)}
  let(:file_attr) {File.readlines('lib/bug.rb')}
 context "when indentation file is called" do
  describe "#indent" do
  it {is_expected.to respond_to(:send).with(1).argument}
   specify{expect(l.send(:indent,File.readlines('lib/bug.rb'))).to  be_nil }
end 
end 
end