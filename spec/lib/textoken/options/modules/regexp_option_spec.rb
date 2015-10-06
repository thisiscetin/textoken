require 'spec_helper'

module Textoken
  # A test dummy
  class LastDumy
    include RegexpOption
  end
end

describe Textoken::RegexpOption do
  describe '#initialize' do
    context 'populating regexp arry' do
      it 'does not raise error' do
        expect do
          Textoken::LastDumy.new('\w+')
        end.to_not raise_error
      end

      it 'does populate array' do
        t = Textoken::LastDumy.new('\w+')
        expect(t.regexps).to eq([Regexp.new('\w+')])
      end
    end

    context 'initializing findings' do
      it 'successfully' do
        t = Textoken::LastDumy.new('\w+')
        expect(t.findings.class).to eq(Textoken::Findings)
      end
    end
  end
end
