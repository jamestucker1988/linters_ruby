# require('./bin/main')
  require('./bin/main')
  RSpec.describe Linter do
    let(:lint) { Linter.new('bug.rb') }
    let(:file_attr) { File.readlines('bug.rb') }
    context 'when indentation file is called' do
      describe '#indent' do 
        it { is_expected.to respond_to(:send).with(1).argument }
        context 'when $i is less than func.size ' do
          before(:each) do 
            $i = 0
            indent = double
            allow(indent).to receive(:indent_c)
            allow(lint).to receive(:puts) { "indentation error at line  #{$i} #{lint.indent.cur_indent} #{lint.indent.line1_space},#{lint.indent.line2_space} " }
          end
        end
      end
      describe '#res_key' do
        it { expect($arr1).to be_an(Array) }
      end
    end
    context 'when empty_line file is called' do
      describe '#empty_line1' do
        it { is_expected.to respond_to(:send).with(1).argument }
        it { expect { lint.send(:empty_line1, file_attr).to yield_control } }
      end
    end
    context 'when white_space file is called' do
      describe '#trail_space' do
        it { is_expected.to respond_to(:send).with(1).argument }
      end
    end
    context 'when end_count is called' do
      describe '#end_number' do
        it { is_expected.to respond_to(:send).with(1).argument }
        specify { expect { lint.send(:end_number, file_attr).func.to yield_control } }
      end
    end

    describe '#indent_c' do
      it 'should return a integer' do 
        allow(lint).to receive(:indent_c).and_return(1)
        expect(lint.indent_c).to be_between(-2, 2).inclusive
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
    end
    #describe Brackets do
      describe '#bracket' do
        it { is_expected.to respond_to(:send).with(1).argument }
        specify { expect { print('this missing bracket') }.to output.to_stdout }
      end
    #end
    #describe End_count1 do
      describe '#end_number' do
        it { is_expected.to respond_to(:send).with(1).argument }
        specify { expect { print('unexpected end-of-input expecting end') }.to output.to_stdout }
      end
    #  describe Empty_line1 do
        describe '#empty_line1' do
          it { is_expected.to respond_to(:send).with(1).argument }
          specify { expect { print('empty line at #{i + 1}') }.to output.to_stdout }
        end
      #end
    #end
  #end
  end