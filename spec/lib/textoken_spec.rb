require 'spec_helper'

describe Textoken do
  it 'should initialize lib/base class through Textoken' do
    expect(Textoken('Some text').class).to eq(Textoken::Base)
  end

  it 'should raise ExpressionError with unpermitted options' do
    expect do
      textoken(dumy: 'value')
    end.to raise_error(Textoken::ExpressionError)
  end

  it 'should return tokens with more_than option' do
    expected_result = %w(exercitationem reprehenderit)
    expect(textoken(more_than: 12)).to eq(expected_result)
  end

  it 'should return tokens with less_than option' do
    expected_result = %w(, . ?)
    expect(textoken(less_than: 2).uniq).to eq(expected_result)
  end

  it 'should return tokens when less_than & more_than combined' do
    expected_result = %w(perspiciatis consequuntur)
    expect(textoken(less_than: 13, more_than: 11)).to eq(expected_result)
  end

  def textoken(options)
    Textoken(TEXT, options).tokens
  end

  TEXT = 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem
  accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo
  inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
  Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,
  sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.
  Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur,
  adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et
  dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis
  nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex
  ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea
  voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem
  eum fugiat quo voluptas nulla pariatur?'
end
