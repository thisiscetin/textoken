require 'spec_helper'

describe Textoken::Only do
  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it 'should tokenize under expected length' do
    t        = Textoken::Only.new('punctuations')
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(, , .))
  end
end
