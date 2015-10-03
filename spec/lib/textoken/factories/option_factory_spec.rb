require 'spec_helper'

describe Textoken::OptionFactory do
  context '#build' do
    it 'returns option key as a class even if it needs to be camelized' do
      t = Textoken::OptionFactory.build(:less_than, 3)
      expect(t.class).to eq(Textoken::LessThan)
    end

    it 'returns option key as a class when class name needs not camelized' do
      t = Textoken::OptionFactory.build(:only, 'dates')
      expect(t.class).to eq(Textoken::Only)
    end

    it 'raises error when initialized with unpermitted option' do
      expect do
        Textoken::OptionFactory.build(:dumy, 'dumy')
      end.to raise_error(Textoken::ExpressionError)
    end
  end
end
