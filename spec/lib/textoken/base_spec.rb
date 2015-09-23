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
    expect(t.options).to eq(only: 'alphanumeric')
  end

  it 'should return DefaultTokenizer to tokens when no options present' do
    t = Textoken::Base.new("Alfa is beta.?\' !alfa", exclude: 'alpha', only: 'beta')
    expect(t.tokens).to eq('')
  end

  # it 'should fail when more than one option supplied' do
  #   expect do
  #     Textoken::Base.new('Alfa is beta.', only: 'aplhanumeric', 
  #       exclude: 'numbers').tokens
  #   end.to raise_error
  # end

  # it 'should return tokens' do
  #   t = Textoken::Base.new('Alfa is beta.', only: 'apl').tokens
  #   expect(t).to eq('')
  # end
end
