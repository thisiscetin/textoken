require 'spec_helper'

class Dumy < Textoken::Option
end

describe Textoken::Option do
  it 'should not raise error when initialized with permitted value' do
    expect do
      Dumy.new('dates')
    end.to_not raise_error
  end

  it 'should raise error if initialized with unpermitted value' do
    expect do
      Dumy.new('dumy')
    end.to raise_error(Textoken::ExpressionError)
  end

  it 'should already populate regexps array post initialization' do
    d = Dumy.new('punctuations')
    expect(d.regexps.first).to eq('\\W+')
    expect(Dumy.new('dates').regexps.size).to eq(2)
  end

  it 'should raise inheritence error when priority not defined' do
    d = Dumy.new('dates')
    expect do
      d.priority
    end.to raise_error(Textoken::InheritenceError)
  end

  it 'should raise inheritence error when tokenize not defined' do
    d = Dumy.new('dates')
    expect do
      d.tokenize(['Alfa'])
    end.to raise_error(Textoken::InheritenceError)
  end
end
