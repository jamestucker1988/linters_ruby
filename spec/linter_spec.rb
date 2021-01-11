# frozen_string_literal: true

require('./bin/main')
RSpec.describe Linter do
  let(:lint) { Linter.new('bug.rb') }
  let(:file_attr) { File.readlines('bug.rb') }
  let(:arr) { %w(( )) }
  context 'when indentation file is called' do
    describe '#indent' do
      it { is_expected.to respond_to(:indent_calc).with(2).argument }
      it { is_expected.to respond_to(:res_key) }
    end
    describe '#res_key' do
      it { expect(lint.res_key).to be_an(Array) }
    end
    describe '#indent_call' do
      it { expect { raise 'indent_call' }.to raise_error(RuntimeError) }
    end
    describe '#indent_calc' do
      it { is_expected.to respond_to(:indent_c).with(2).argument }
      it { is_expected.to respond_to(:line_cal).with(1).argument }
      it { is_expected.to respond_to(:indent_call).with(1).argument }
      it { expect { raise 'indent_calc' }.to raise_error(RuntimeError) }
    end
    describe '#line_cal' do
      it { expect(lint.line_cal(3)).to be_an(Integer) }
    end
    describe '#arrin?' do
      it { expect(lint.arrin?(arr, 2)).to be_nil }
      it { expect(lint.arrin?(['def'], 1)).to be_truthy }
    end
    describe '#arr2in?' do
      it { expect(lint.arr2in?(['else'], 24)).to be_nil }
    end
    describe '#indent_c' do
      it { expect(lint.indent_c(['def'], 1)).to be_truthy }
    end
  end
  context 'when trail_space is called' do
    describe '#trail_space' do
      it { expect { raise 'trail_space' }.to raise_error(RuntimeError) }
    end
  end
  context 'when end_number is called' do
    describe '#end_number' do
      it { expect { raise 'expecting end' }.to raise_error(RuntimeError) }
    end
  end
  context 'when empty_line1 is called' do
    describe '#empty_line1' do
      it { expect { raise 'empty_line1' }.to raise_error(RuntimeError) }
    end
  end
  context 'when bracket is called' do
    describe '#bracket' do
      it { is_expected.to respond_to(:brack_block).with(3).argument }
    end
    describe 'brack_block' do
      it { is_expected.to respond_to(:r_brack).with(2).argument }
    end
    describe 'r_brack' do
      it { expect { raise('r_brack') }.to raise_error(RuntimeError) }
    end
  end
  context 'when f_edit is called' do
    describe '#f_edit' do
      it { expect(lint.f_edit).to be_an(Array) }
    end
  end
end
