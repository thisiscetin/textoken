require 'spec_helper'

describe Textoken do
  it 'should initialize lib/base class through Textoken' do
    expect(Textoken('Some text').class).to eq(Textoken::Base)
  end

  it 'sould raise ExpressionError with unpermitted options' do
    expect do
      Textoken('Some text', dumy: 'none').tokens
    end.to raise_error(Textoken::ExpressionError)
  end
end