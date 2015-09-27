require 'spec_helper'

describe Textoken::Options do
  it 'should be initializable by nil options' do
    init_without_error
  end

  it 'should be initializable with valid option' do
    init_without_error(split: 'punctuations')
  end

  it 'should be initializable by many valid options' do
    init_without_error(split: 'punctuations', exclude: 'numbers', more_than: 3)
  end

  it 'should sort options by their priority' do
    t = Textoken::Options.new(options)
    expect(t.options[0].class).to eq(Textoken::Split)
    expect(t.options[1].class).to eq(Textoken::LessThan)
    expect(t.options[2].class).to eq(Textoken::Only)
  end

  it 'should send tokenize to options collection' do
    t = Textoken::Options.new(options)
    expect(t.options.first).to receive(:tokenize).with(['Textoken'])
    t.tokenize(['Textoken'])
  end

  def init_without_error(options = nil)
    expect do
      Textoken::Options.new(options)
    end.to_not raise_error
  end

  def options
    {
      only:       'dates',
      split:   'punctuations',
      less_than:  2
    }
  end
end
