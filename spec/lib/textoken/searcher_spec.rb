require 'spec_helper'

describe Textoken::Searcher do
  describe 'initialize' do
    context 'when values are in correct form' do
      it 'supports single value' do
        expect_no_error(init('dates'))
      end

      it 'supports multiple values commas' do
        t = expect_no_error(init('numbers, dates'))
        expect(t.values).to eq(%w(numbers dates))
      end

      it 'supports multiple values with commas & spaces' do
        t = expect_no_error(init('numbers , dates   ,punctuations'))
        expect(t.values).to eq(%w(numbers dates punctuations))
      end
    end

    context 'when values are unexpected objects' do
      it 'raises error to non strings' do
        expect_exp_error(1)
      end

      it 'raises error to non strings with commas' do
        expect_exp_error([1, 2, 3])
      end
    end

    def init(values)
      Textoken::Searcher.new(values)
    end

    def expect_no_error(object)
      expect do
        object
      end.to_not raise_error
      object
    end

    def expect_exp_error(values)
      expect do
        init(values)
      end.to raise_error(Textoken::ExpressionError)
    end
  end
end
