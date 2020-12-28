require_relative '../bin/main'
require_relative('../lib/brackets')
require_relative('../lib/white_space')
require_relative('../lib/end_count')
require_relative('../lib/empty_line')
require_relative('../lib/indentation')
require 'colorize'

describe 'class Linters' do
  let(:l) { Linter.new }
  specify { expect(l).to be_an_instance_of(Linter) }
  let(:file_attr) { File.readlines('lib/bug.rb') }
  context 'when indentation file is called' do
    describe '#indent' do
      it { is_expected.to respond_to(:send).with(1).argument }
      specify { expect(l.send(:indent, File.readlines('lib/bug.rb'))).to be_nil }
    end
  end
  context 'when empty_line file is called' do
    describe '#empty_line1' do
      it { is_expected.to respond_to(:send).with(1).argument }
      it { expect { l.send(:empty_line1, file_attr).func.to yield_control } }
    end
  end
  context 'when white_space file is called' do
    describe '#trail_space' do
      it { is_expected.to respond_to(:send).with(1).argument }
      specify { expect { l.send(:trail_space, file_attr).func.to yield_control } }
      specify { expect { |x| l.trail_space(file_attr).each_with_index(&x) }.to yield_control }
    end
  end
  context 'when end_count is called' do
    describe '#end_number' do
      it { is_expected.to respond_to(:send).with(1).argument }
      specify { expect { l.send(:end_number, file_attr).func.to yield_control } }
    end
  end
  # end
  describe Indentation do
    let(:including_class) { Class.new.send(:include, Indentation).new }
    let(:file_attr) { File.readlines('lib/bug.rb') }
    describe '#indent' do
      it { is_expected.to respond_to(:send).with(1).argument }
      it 'main method and should return nil' do
        expect(including_class.indent(file_attr)).to eq(nil)
      end
    end
    describe '#indent_c' do
      it 'should return a integer' do
        expect(including_class.indent_c).to be_between(-2, 1).exclusive
      end
    end
    describe '#res_key' do
      it { is_expected.to respond_to(:send).with(1).argument }
      it 'should have a initialized constant $i' do
        expect($i).to be_an(Numeric)
      end
    end
    describe '#end_num' do
      it 'should return a array' do
        expect($arr1).to be_an(Array)
      end
      # end
    end
    describe Brackets do
      describe '#bracket' do
        it { is_expected.to respond_to(:send).with(1).argument }
        specify { expect { print('this missing bracket') }.to output.to_stdout }
      end
    end
    describe End_count1 do
      describe '#end_number' do
        it { is_expected.to respond_to(:send).with(1).argument }
        specify { expect { print('unexpected end-of-input expecting end') }.to output.to_stdout }
      end
      describe Empty_line1 do
        describe '#empty_line1' do
          it { is_expected.to respond_to(:send).with(1).argument }
          specify { expect { print('empty line at #{i + 1}') }.to output.to_stdout }
        end
      end
    end
  end
end
