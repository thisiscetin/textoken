require 'spec_helper'

describe Textoken do
  it 'should initialize lib/base class through Textoken' do
    expect(Textoken('Some text').class).to eq(Textoken::Base)
  end

  it 'should raise ExpressionError with unpermitted options' do
    expect do
      Textoken('Some text', dumy: 'none').tokens
    end.to raise_error(Textoken::ExpressionError)
  end

  it 'should return tokens with less_than option' do
    text = 'Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur.'
    t = Textoken(text, less_than: 4).tokens
    expect(t).to eq(['in', 'in', 'eu'])
  end
end
