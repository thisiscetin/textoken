require 'spec_helper'

module Textoken
  # A test dummy
  class Dumy
    include ConditionalOption

    def tokenize_true(base)
      @base = base
      tokenize_if { |word, _regexp| word == 'Alfa' }
    end

    def tokenize_false(base)
      @base = base
      tokenize_if { |word, _regexp| word != 'Alfa' }
    end
  end
end

describe Textoken::ConditionalOption do
  describe '#initialize' do
    context 'when initialized with unexpected regexp' do
      it 'raises an error' do
        expect do
          Textoken::Dumy.new('dumy')
        end.to raise_error(Textoken::ExpressionError)
      end
    end

    context 'sets regexps & findings' do
      it 'sets regexp' do
        t = Textoken::Dumy.new('dates')
        expect(t.regexps.length).to be > 0
      end

      it 'sets findings' do
        t = Textoken::Dumy.new('dates')
        expect(t.findings.class).to eq(Textoken::Findings)
      end
    end
  end

  describe '#tokenize_if' do
    let(:base) { double('base') }
    before do
      allow(base).to receive(:text).and_return(%w(Alfa beta teta))
    end

    context 'when initialized with a true block' do
      it 'pushes findings' do
        t = Textoken::Dumy.new('dates')
        expect(t.tokenize_true(base)).to eq(%w(Alfa))
      end
    end

    context 'when initialized with a false block' do
      it 'does not push findings' do
        t = Textoken::Dumy.new('dates')
        expect(t.tokenize_false(base)).to eq(%w(beta teta))
      end
    end
  end
end
