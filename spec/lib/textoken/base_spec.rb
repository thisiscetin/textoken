require 'spec_helper'

describe Textoken::Base do
  describe '#initialization' do
    it 'with no options does not raise error' do
      expect do
        init('')
      end.to_not raise_error
    end

    it 'with no text does not raise error' do
      expect do
        init
      end.to_not raise_error
    end

    it 'initially splits the text' do
      expect(init('Alfa beta.').text).to eq(%w(Alfa beta.))
    end

    it 'inits findings & options as expected' do
      expect(init('').options.class).to eq(Textoken::Options)
    end
  end

  describe '#tokens' do
    context 'does not raise an error' do
      it 'when no text present' do
        expect do
          init.tokens
        end.to_not raise_error
      end

      it 'when no option present' do
        expect do
          init('Alfa beta.').tokens
        end.to_not raise_error
      end
    end
  end

  describe '#words' do
    context 'does not raise an error' do
      it 'when no text present' do
        expect do
          init.words
        end.to_not raise_error
      end

      it 'when no option present' do
        expect do
          init('Alfa beta.').words
        end.to_not raise_error
      end
    end
  end

  def init(text = nil, opt = nil)
    Textoken::Base.new(text, opt)
  end
end
