require 'spec_helper'

describe Textoken::Findings do
  describe '#push' do
    context 'when arguments are nil' do
      it 'raises error for word' do
        expect_error(1, nil)
      end

      it 'raises error for index' do
        expect_error(nil, 'Alfa')
      end
    end

    context 'when arguments are a member of different class' do
      it 'raises error for word' do
        expect_error([1], 'Alfa')
      end

      it 'raises error for index' do
        expect_error(2, Textoken::Findings)
      end
    end

    context 'when arguments are as expected' do
      it 'adds word to collection' do
        t = Textoken::Findings.new
        t.push(2, 'Alfa')
        expect(t.collection).to eq([[2, 'Alfa']])
      end
    end
  end

  describe '#collection' do
    it 'returns collection in sorted order' do
      t = Textoken::Findings.new
      push_many(t, [1, 'Alfa'], [3, 'Teta'], [2, 'Beta'])
      expect(t.collection.length).to eq(3)
      expect(t.collection).to eq([[1, 'Alfa'], [2, 'Beta'], [3, 'Teta']])
    end

    it 'returns a unique array under index' do
      t = Textoken::Findings.new
      push_many(t, [1, 'Alfa'], [1, 'Beta'], [2, 'Teta'])
      expect(t.collection.length).to eq(2)
      expect(t.collection).to eq([[1, 'Alfa'], [2, 'Teta']])
    end
  end

  describe '#result' do
    it 'returns collection in sorted order as a single dimension array' do
      t = Textoken::Findings.new
      push_many(t, [1, 'Alfa'], [3, 'Teta'], [2, 'Beta'])
      expect(t.result).to eq(%w(Alfa Beta Teta))
    end
  end

  def push_many(object, *args)
    args.each { |a| object.push(a[0], a[1]) }
  end

  def expect_error(word, index)
    expect do
      Textoken::Findings.new.push(word, index)
    end.to raise_error(Textoken::TypeError)
  end
end
