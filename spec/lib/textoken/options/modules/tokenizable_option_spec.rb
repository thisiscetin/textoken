require 'spec_helper'

module Textoken
  # A test dummy
  class TheDumy
    include TokenizableOption

    private

    def tokenize_condition
    end
  end
end

module Textoken
  # Another test dummy
  class TheErrorDumy
    include TokenizableOption
  end
end

describe Textoken::TokenizableOption do
  describe '#tokenize' do
    context 'sets the base' do
      it 'as expected' do
        t      = Textoken::TheDumy.new
        object = Object.new
        t.tokenize(object)
        expect(t.base).to eq(object)
      end
    end

    context 'sends tokenize_condition' do
      it 'as expected' do
        t = Textoken::TheDumy.new
        expect(t).to receive(:tokenize_condition)
        t.tokenize(Object.new)
      end
    end

    context 'raises error when not implemented' do
      it 'as expected' do
        t = Textoken::TheErrorDumy.new
        expect do
          t.tokenize(Object.new)
        end.to raise_error(Textoken::TypeError)
      end
    end
  end
end
