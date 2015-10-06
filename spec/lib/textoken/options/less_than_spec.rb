require 'spec_helper'

describe Textoken::LessThan do
  it_behaves_like 'module sharing option', 5
  include_context 'base mock'

  describe '#initialize' do
    context 'when value is not an Integer' do
      it 'raises type error' do
        expect do
          Textoken::LessThan.new(Object)
        end.to raise_error(Textoken::ExpressionError)
      end
    end

    context 'when value is an integer < 2' do
      it 'raises type error' do
        expect do
          Textoken::LessThan.new(1)
        end.to raise_error(Textoken::ExpressionError)
      end
    end

    context 'when value is an integer > 1' do
      it 'does not raise type error' do
        expect do
          Textoken::LessThan.new(2)
        end.to_not raise_error
      end
    end
  end

  describe '#tokenize' do
    context 'when text array is an empty array' do
      it 'does not raise an error & push nothing to findings' do
        init_mocks
        expect do
          Textoken::LessThan.new(2).tokenize(base)
        end.to_not raise_error
      end
    end

    context 'when base class has expected structure' do
      it 'tokenize as expected' do
        init_mocks(%w(Alfa Beta Thermodynamics Teta))
        t = Textoken::LessThan.new(5).tokenize(base)
        expect(t).to eq(%w(Alfa Beta Teta))
      end
    end
  end
end
