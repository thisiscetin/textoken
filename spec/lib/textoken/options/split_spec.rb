require 'spec_helper'

describe Textoken::Split do
  it_behaves_like 'an option', 'punctuations'

  it 'should tokenize text as expected' do
    t = Textoken::Split.new('punctuations')
    tokenize = t.tokenize(%w(Alfa, beta. Really! None))
    expect(tokenize).to eq(%w(Alfa , beta . Really ! None))
  end
end
