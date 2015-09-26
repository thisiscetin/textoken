require 'spec_helper'

describe Textoken::Exclude do
  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it 'should tokenize under expected length' do
    t        = Textoken::Exclude.new('punctuations')
    text_arr = 'amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(adipisci))
  end
end
