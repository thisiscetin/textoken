require 'spec_helper'

describe Textoken::LessThan do
  it_behaves_like 'an option', 5
  it_behaves_like 'a numeric option'

  it 'should tokenize under expected length' do
    t        = Textoken::LessThan.new(5)
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(est qui quia sit))
  end
end
