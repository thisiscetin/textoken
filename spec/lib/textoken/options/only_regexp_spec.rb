require 'spec_helper'

describe Textoken::OnlyRegexp do
  include_context 'base mock'

  describe '#tokenize' do
    it 'as expected 0' do
      init_mocks(%w(Alfonso 444 555 Beta))
      t = Textoken::OnlyRegexp.new('^[0-9]*$').tokenize(base)
      expect(t).to eq(%w(444 555))
    end

    it 'as expected 1' do
      init_mocks(%w(333 Alfonso 11))
      t = Textoken::OnlyRegexp.new('^[0-9]*$').tokenize(base)
      expect(t).to eq(%w(333 11))
    end

    it 'as expected 1' do
      init_mocks(%w(333 Alfonso 11))
      t = Textoken::OnlyRegexp.new('[a-zA-Z]+').tokenize(base)
      expect(t).to eq(%w(Alfonso))
    end
  end
end
