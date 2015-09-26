require 'spec_helper'

describe Textoken::LessThan do
  it 'should be inherited from option' do
    expect(described_class).to be < Textoken::Option
  end

  it 'should be initializable with an integer' do
    validate_numericality_without_error(3)
  end

  it 'should raise errors in initialization for non-integers' do
    validate_numericality_with_error('1, 2')
  end

  it 'should raise error when value integer = 0' do
    validate_numericality_with_error(0)
  end

  it 'should raise error when value integer is negative' do
    validate_numericality_with_error(-1)
  end

  def validate_numericality_with_error(value)
    init_numericality(value).to raise_error(Textoken::TypeError)
  end

  def validate_numericality_without_error(value)
    init_numericality(value).to_not raise_error
  end

  def init_numericality(value)
    expect do
      Textoken::LessThan.new(value)
    end
  end

  it 'should tokenize under expected length' do
    t        = Textoken::LessThan.new(5)
    text_arr = 'Neque porro quisquam est qui dolorem ipsum
    quia dolor sit amet, consectetur, adipisci velit.'.split(' ')
    expect(t.tokenize(text_arr)).to eq(%w(est qui quia sit))
  end
end
