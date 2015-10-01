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
  end
end

describe Textoken::Tokenizer do
  describe 'initialize' do
  end

  describe 'tokens' do
    context 'should not raise errors' do
      it 'when findings collection array is empty' do
      end
    end

    context 'should return expected tokens' do
      it 'when dont_split is true' do
      end

      it 'when dont_split option is nil' do
        t = Textoken::Tokenizer.new(TestDumy::Dumy.new)
        expect(t.tokens).to eq('')
      end
    end

  end
end
