require 'spec_helper'

describe Textoken::LessThan do
  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it 'should tokenize under expected length' do
    t        = Textoken::LessThan.new(4)
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(['est', 'qui', 'sit'])
  end
end
