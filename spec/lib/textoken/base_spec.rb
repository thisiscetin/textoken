require 'spec_helper'

describe Textoken::Base do
  it 'should init Options on initialize if options present' do
    options = { less_than: 3 }
    expect(Textoken::Options).to receive(:new).with(options)
    Textoken::Base.new('', options)
  end

  it 'options should not be init & nil when no user option present' do
    expect(Textoken::Options).to_not receive(:new)
    t = Textoken::Base.new('')
    expect(t.options).to eq(nil)
  end

  it 'should return basic splitted text when no option present' do
    t = Textoken::Base.new('Alfa beta.')
    expect(t.tokens).to eq(['Alfa', 'beta.'])
  end
end
