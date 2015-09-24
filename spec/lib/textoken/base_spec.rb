require 'spec_helper'

describe Textoken::Base do
  it 'should be initializable only by text' do
    expect do
      Textoken::Base.new('Alfa is beta.')
    end.not_to raise_error
  end

  it 'options and text has to be readable' do
    t = Textoken::Base.new('Alfa is beta.', only: 'alphanumeric')
    expect(t.text).to eq('Alfa is beta.')
  end

  it 'should return processed text when options not present' do
    t = Textoken::Base.new('Alfa is beta.')
    expect(t.tokens).to eq(['Alfa', 'is', 'beta', '.'])
  end

  skip 'tests with options' do
  end
end
