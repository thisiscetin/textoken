require 'spec_helper'

describe Textoken do
  TEXT0 = 'Oh, no,\" she\'s saying, "our $400 blender can\'t handle something
  this hard!'

  describe '#initialize' do
    it 'lib/base class through Textoken' do
      expect(Textoken('Some text').class).to eq(Textoken::Base)
    end

    context 'with unpermitted options' do
      it 'tokens raise Expression error' do
        expect do
          tokens('Some text', dumy: 'value')
        end.to raise_error(Textoken::ExpressionError)
      end

      it 'words raise Expression error' do
        expect do
          words('Some text', dumy: 'value')
        end.to raise_error(Textoken::ExpressionError)
      end
    end
  end

  describe 'No options just text' do
    it 'returns tokens as expected' do
      e = %w(Alfa ' s home is nice .)
      expect(tokens('Alfa\'s home is nice.')).to eq(e)
    end

    it 'handles special characters' do
      e = %w(þú ert ástin mín .)
      expect(tokens('þú ert ástin mín.')).to eq(e)
    end

    it 'returns words as expected' do
      e = %w(Alfa's home is nice.)
      expect(words('Alfa\'s home is nice.')).to eq(e)
    end
  end

  describe 'Multiple Options' do
    context 'only & more_than' do
      it 'returns tokens as expected' do
        e = %w($ 400)
        expect(tokens(TEXT0, only: 'numerics', more_than: 3)).to eq(e)
      end

      it 'returns words as expected' do
        e = %w($400)
        expect(words(TEXT0, only: 'numerics', more_than: 3)).to eq(e)
      end
    end

    context 'exlcude & more_than' do
      it 'returns tokens as expected' do
        e = %w(Oh , " our this)
        expect(tokens(TEXT0, exclude: 'numerics', less_than: 5)).to eq(e)
      end

      it 'returns words as expected' do
        e = %w(blender handle something this)
        expect(words(TEXT0, exclude: 'punctuations', more_than: 1)).to eq(e)
      end
    end
  end

  # After adding a regexp value to option_values.yml
  # Corresponding test can be done under singe options
  # both words and tokens has to be tested
  describe 'Single Options' do
    context 'phones' do
      it 'returns tokens as expected' do
        e = %w(444 - 555 - 1234)
        expect(tokens('444-555-1234 Alfa beta.', only: 'phones')).to eq(e)
      end

      it 'returns words as expected' do
        e = %w(246.555.8888)
        expect(words('246.555.8888 Alfa beta.', only: 'phones')).to eq(e)
      end
    end

    context 'dates' do
      it 'returns tokens as expected' do
        e = %w(01 / 09 / 1986)
        expect(tokens('01/09/1986 Alfa beta.', only: 'dates')).to eq(e)
      end

      it 'returns words as expected' do
        e = %w(30-01-2000)
        expect(words('Teta 30-01-2000 Alfa beta.', only: 'dates')).to eq(e)
      end
    end
  end

  def tokens(text, options = nil)
    Textoken(text, options).tokens
  end

  def words(text, options = nil)
    Textoken(text, options).words
  end
end
