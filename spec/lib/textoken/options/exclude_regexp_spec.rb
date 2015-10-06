require 'spec_helper'

describe Textoken::ExcludeRegexp do
  include_context 'base mock'

  describe '#tokenize' do
    it 'as expected 0' do
      init_mocks(%w(Alfonso 444 555 Beta))
      r = Textoken::ExcludeRegexp.new('^[0-9]*$').tokenize(base)
      expect(r).to eq(%w(Alfonso Beta))
    end

    it 'as expected 1' do
      init_mocks(%w())
      r = Textoken::ExcludeRegexp.new('^[0-9]*$').tokenize(base)
      expect(r).to eq(%w())
    end

    it 'as expected 2' do
      init_mocks(%w(Alfa 213 Beta 23.4))
      r = Textoken::ExcludeRegexp.new('^[0-9]*$').tokenize(base)
      expect(r).to eq(%w(Alfa Beta 23.4))
    end
  end
end
