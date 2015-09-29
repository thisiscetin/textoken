require 'spec_helper'

describe Textoken::Base do
  describe 'initialization of class' do
    it 'should initialize with no options' do
      expect do
        init('')
      end.to_not raise_error
    end

    it 'should initialize with no text' do
      expect do
        init
      end.to_not raise_error
    end

    it 'should split the text' do
      expect(init('Alfa beta.').text).to eq(%w(Alfa beta.))
    end

    it 'should init findings & options' do
      expect(init('').findings.class).to eq(Textoken::Findings)
      expect(init('').options.class).to eq(Textoken::Options)
    end
  end

  describe 'should respond to tokens as expected' do
    context 'should not raise an error' do
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

  def init(text = nil, opt = nil)
    Textoken::Base.new(text, opt)
  end
end
