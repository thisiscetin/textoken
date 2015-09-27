require 'spec_helper'

describe Textoken::OptionFactory do
  it 'should return option key as a class' do
    t = Textoken::OptionFactory.build(:split, 'punctuations')
    expect(t.class).to eq(Textoken::Split)
  end

  it 'should return option key as a class even if it needs to be camelized' do
    t = Textoken::OptionFactory.build(:less_than, 3)
    expect(t.class).to eq(Textoken::LessThan)
  end

  it 'should raise error when initialized with unpermitted option' do
    expect do
      Textoken::OptionFactory.build(:dumy, 'dumy')
    end.to raise_error(Textoken::ExpressionError)
  end
end
