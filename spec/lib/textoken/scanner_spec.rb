require 'spec_helper'

describe Textoken::Scanner do
  describe '#initialize' do
    context 'when arguments are as expected' do
      it 'should be initializable with a string and regexp' do
        expect do
          Textoken::Scanner.new('Alfa', regexp)
        end.to_not raise_error
      end
    end

    context 'when arguments are not as expected' do
      it 'should raise type error when regexp is not correct' do
        expect do
          Textoken::Scanner.new('Alfa', 'dumy')
        end.to raise_error(Textoken::TypeError)
      end

      it 'should raise type error when word is not a string' do
        expect do
          Textoken::Scanner.new(1, regexp)
        end.to raise_error(Textoken::TypeError)
      end
    end
  end

  describe '#result' do
    it 'should return an empty array when no matches found' do
      s = Textoken::Scanner.new('Alfa', regexp)
      expect(s.result).to eq([])
    end

    it 'should return an array of strings including punctuation' do
      s = Textoken::Scanner.new('123 -456 -789!', regexp)
      expect(s.result).to eq(%w(123 - 456 - 789 !))
    end

    it 'should not return an empty string' do
      s = Textoken::Scanner.new('123-456-789!  ? ... ', regexp)
      expect(s.result).to eq(%w(123 - 456 - 789 ! ? ...))
    end
  end

  def regexp
    Regexp.new('\W+')
  end
end
