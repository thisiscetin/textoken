require 'spec_helper'

describe Textoken::Options do
  describe 'initialization of class' do
    it 'should raise error with unexpected hash format' do
      expect_error('Alfa beta.')
      expect_error(['Alfa', 'beta', '.'])
    end

    it 'should not raise error with expected hash format' do
      expect_no_error(more_than: 3)
      expect_no_error(more_than: 3, only: 'phones, dates')
    end

    it 'should not raise error with nil options' do
      expect_no_error
    end
  end

  describe 'collection' do
    context 'when no options present' do
      it 'should return an empty array' do
        expect(init.collection).to eq([])
      end
    end

    context 'when options present' do
      let(:option) { double('option') }
      before do
        init_mock
      end

      it 'should return empty array when no options present' do
        expect(init.collection).to eq([])
      end

      it 'should return one option object at array when option length is one' do
        collection = init(more_than: 3).collection
        expect(collection.size).to eq(1)
        expect(collection[0].class).to eq(RSpec::Mocks::Double)
      end

      it 'should return object array linear to hash size' do
        hash = {}
        (1...10).each do |i|
          hash[i.to_s.to_sym] = i
          expect(init(hash).collection.length).to eq(i)
        end
      end
    end
  end

  def init_mock
    allow(option).to receive(:priority)
      .and_return(1)
    allow(Textoken::OptionFactory).to receive(:build)
      .and_return(option)
  end

  def init(opt = nil)
    Textoken::Options.new(opt)
  end

  def expect_error(opt)
    expect do
      init(opt)
    end.to raise_error(Textoken::ExpressionError)
  end

  def expect_no_error(opt = nil)
    expect do
      init(opt)
    end.to_not raise_error
  end
end
