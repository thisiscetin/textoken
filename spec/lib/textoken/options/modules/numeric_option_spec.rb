require 'spec_helper'

module Textoken
  # A test dummy
  class AnotherDumy
    include NumericOption

    def tokenize_true(base)
      @base = base
      tokenize_if { |word, _regexp| word.length > number }
    end

    def tokenize_false(base)
      @base = base
      tokenize_if { |word, _regexp| word.length < number }
    end

    private

    def validate_option_value
      validate { |value| value > 1 }
    end
  end
end

describe Textoken::NumericOption do
  describe '#initialize' do
    context 'when initialized with unexpected number' do
      it 'raises an error' do
        expect do
          Textoken::AnotherDumy.new(-1)
        end.to raise_error(Textoken::ExpressionError)
      end
    end

    context 'sets number & findings' do
      it 'sets number' do
        t = Textoken::AnotherDumy.new(2)
        expect(t.number).to eq(2)
      end

      it 'sets findings' do
        t = Textoken::AnotherDumy.new(2)
        expect(t.findings.class).to eq(Textoken::Findings)
      end
    end
  end

  describe '#tokenize_if' do
    let(:base) { double('base') }
    before do
      allow(base).to receive(:text).and_return(%w(Alfa omega conditional))
    end

    context 'when initialized with a true block' do
      it 'pushes findings' do
        t = Textoken::AnotherDumy.new(5)
        expect(t.tokenize_true(base)).to eq(%w(conditional))
      end
    end

    context 'when initialized with a false block' do
      it 'does not push findings' do
        t = Textoken::AnotherDumy.new(5)
        expect(t.tokenize_false(base)).to eq(%w(Alfa))
      end
    end
  end
end
