require 'spec_helper'

describe Textoken do
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

  describe 'Multiple Options' do
    context 'only & more_than' do
      it 'returns tokens as expected' do
        e = %w(saying , $ 400)
        expect(tokens(TEXT0, only: 'numerics', more_than: 3)).to eq(e)
      end
    end

    context 'exlcude & more_than' do
      it 'returns tokens as expected' do
        e = %w(saying , $ 400)
        expect(tokens(TEXT0, exclude: 'numerics', less_than: 5)).to eq(e)
      end

      # it 'returns words as expected' do
      #   e = %w(saying, $400 blender something)
      #   expect(words(TEXT0, only: 'numerics', more_than: 6)).to eq(e)
      # end
    end
  end

  def tokens(text, options)
    Textoken(text, options).tokens
  end

  def words(text, options)
    Textoken(text, options).words
  end

  TEXT0 = 'Oh, no,\" she\'s saying, "our $400 blender can\'t handle something
  this hard!'

  # After adding a regexp value to option_values.yml
  # Corresponding test can be done under singe options
  describe 'Single Options' do
  end
end
