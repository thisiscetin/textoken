require 'spec_helper'

describe Textoken::Split do
  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it 'should raise error when more than one option value present' do
  end

  it 'should tokenize text as expected' do
    t = Textoken::Split.new('punctuations')
    tokenize = t.tokenize(%w(Alfa, beta. Really! None))
    expect(tokenize).to eq(%w(Alfa , beta . Really ! None))
  end
end
