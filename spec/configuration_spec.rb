require 'spec_helper'

describe Cronjob::Configuration do
  let(:token) { 'somestring' }
  it 'works' do
    Cronjob.configure do |config|
      config.token = token
    end
    expect(Cronjob.configuration.token).to eq(token)
  end
end
