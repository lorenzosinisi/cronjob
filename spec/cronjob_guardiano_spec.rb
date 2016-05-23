require 'spec_helper'

describe Cronjob do
  it 'has a version number' do
    expect(Cronjob::VERSION).not_to be nil
  end

  it 'tests something (un)useful' do
    expect(false).to eq(false)
  end
end
