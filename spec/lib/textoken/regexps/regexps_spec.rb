require 'spec_helper'

# Add a sample text and test it after adding an option value

TEXT_PUNCTUATIONS = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit,
sed do eiusmod tempor incididunt ut labore et dolore magna aliqua! ?'
TEXT_NUMBERS = '$ 2,000,000 is quite a good amount of money. Better than 1000
200.5'
TEXT_DATES = '01/01/2000 is the start of millenium. 05-05-2000 is not.'
TEXT_PHONES = 'p:444-555-1234 f:246.555.8888 m:1235554567 extra'

describe Textoken::Base do
  it 'should tokenize punctuations' do
    match_tokens(TEXT_PUNCTUATIONS, 'punctuations', %w(, , ! ?))
  end

  # it 'should tokenize numbers' do
  #   match_tokens(TEXT_NUMBERS, 'numbers', ['...'])
  # end

  it 'should tokenize phones' do
    match_tokens(TEXT_PHONES, 'phones', %w(444-555-1234 246.555.8888 1235554567))
  end

  it 'should tokenize dates' do
    match_tokens(TEXT_DATES, 'dates', %w())
  end

  def match_tokens(text, option_value, result_array)
    expect(Textoken(text, only: option_value).tokens).to eq(result_array)
  end
end
