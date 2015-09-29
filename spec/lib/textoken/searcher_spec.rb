require 'spec_helper'

describe Textoken::Searcher do
  it 'should initialize successfully' do
    expect do
      Textoken::Searchable.new('dates, numbers')
    end.to_not raise_error
  end

  it 'should raise error when value is not included yml file' do
    expect do
      Textoken::Searchable.new('dumy').regexps
    end.to raise_error(Textoken::ExpressionError)
  end

  it 'yaml should be readable' do
    t = Textoken::Searchable.new('dates, numbers')
    expect(t.regexps.count).to eq(4)
  end
end
