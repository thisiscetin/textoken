require 'spec_helper'

describe Textoken::LessThan do
  it_behaves_like 'an option', 3
  it_behaves_like 'a numeric option'

  it 'should tokenize under expected length' do
    t        = Textoken::MoreThan.new(7)
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(quisquam consectetur, adipisci))
  end
end
