require 'spec_helper'
klass = Cronjob::Ping
endpoint = 'ping'


describe klass do
  before do
  stub_request(:get, "https://www.guardiano.pm/api/v1/ping?auth_token=#{Cronjob.configuration.token}").
         with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Faraday v0.9.2'}).
         to_return(:status => 200, :body => {'ping' => 'pong'}.to_json, :headers => {})
  end
  it 'is loaded' do
    expect(klass).to be
  end
  it "has /#{klass::ENDPOINT} as endpoint" do
    expect(klass::ENDPOINT).to eq(endpoint)
  end
  it "returns a json response" do
    expect(klass.new.response).to be_a(Hash)
  end
  it "returns ping pong" do
    expect(klass.new.response).to eq({'ping' => 'pong'})
  end
end
