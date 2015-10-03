require 'spec_helper'

describe Textoken::Tokenizer do
  include_context 'base mock'

  describe 'tokens' do
    context 'should not raise errors & when findings collection is empty' do
      it 'when dont_split is true' do
        expect do
          Textoken::Tokenizer.new(base)
        end.to_not raise_error
      end

      it 'when dont_split is nil' do
        expect do
          Textoken::Tokenizer.new(base)
        end.to_not raise_error
      end
    end

    context 'should return expected tokens' do
      #will be tested in textoken_spec
    end
  end
end
