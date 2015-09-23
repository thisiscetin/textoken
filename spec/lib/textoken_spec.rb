require 'spec_helper'

describe Textoken do
  it 'should initialize lib/base class through Textoken' do
    expect(Textoken('Some text').class).to eq(Textoken::Base)
  end
end