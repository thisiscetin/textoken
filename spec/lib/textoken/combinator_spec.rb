require 'spec_helper'

describe Textoken::Combinator do
  it 'should return only array when object collection length is one' do
    c = Textoken::Combinator.new([['Alfa']])
    expect(c.intersections).to eq(['Alfa'])
  end

  it 'should return intersection array when more than one array present' do
    c = Textoken::Combinator.new([['Alfa', 'Beta'], ['Beta']])
    expect(c.intersections).to eq(['Beta'])
  end

  it 'should return nothing when there is not intersection' do
    c = Textoken::Combinator.new([['Alfa', 'Beta'], ['Beta'], ['Teta']])
    expect(c.intersections).to eq(Array.new)
  end
end
