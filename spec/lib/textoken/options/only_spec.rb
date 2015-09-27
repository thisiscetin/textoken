require 'spec_helper'

describe Textoken::Only do
  it_behaves_like 'an option', 'dates'

  it 'should tokenize under expected length' do
    t        = Textoken::Only.new('punctuations')
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(, , .))
  end
end
