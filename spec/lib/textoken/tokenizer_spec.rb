require 'spec_helper'

module TestDumy
  # dumy class to mock findings
  class Dumy
    attr_reader :findings, :dont_split

    def initialize(empty = nil, dont_split = nil)
      @findings   = Findings.new(empty)
      @dont_split = dont_split
    end
  end

  # many punctuation types to be tested
  class Findings
    def initialize(empty = nil)
      @empty = empty
    end

    def collection
      return [] if @empty
      [[1, 'Alfa'], [5, 'beta\'s'], [6, 'teta?'], [7, 'omega !'], [9, 'psi.'],
       [10, '123-45-67']]
    end

    def result
      %w(Alfa beta's teta? omega ! psi. 123-45-67)
    end
  end
end

describe Textoken::Tokenizer do
  describe 'tokens' do
    context 'should not raise errors & when findings collection is empty' do
      it 'when dont_split is true' do
        expect do
          Textoken::Tokenizer.new(TestDumy::Dumy.new(true, true))
        end.to_not raise_error
      end

      it 'when dont_split is nil' do
        expect do
          Textoken::Tokenizer.new(TestDumy::Dumy.new(true))
        end.to_not raise_error
      end
    end

    context 'should return expected tokens' do
      it 'when dont_split is true' do
        dumy = TestDumy::Dumy.new(false, true)
        t = Textoken::Tokenizer.new(dumy)
        expect(t.tokens).to eq(%w(Alfa beta's teta? omega ! psi. 123-45-67))
      end

      it 'when dont_split option is nil' do
        t = Textoken::Tokenizer.new(TestDumy::Dumy.new)
        e = %w(beta ' s teta ? omega ! psi . 123 - 45 - 67)
        expect(t.tokens).to eq(e)
      end
    end
  end
end
