require 'spec_helper'

describe Cronjob::Client do
  let(:conn) { Cronjob::Client.new.conn }
  it 'is loaded' do
    expect(Cronjob::Client).to be
  end
  it "has a default api url that is #{Cronjob::Client::DEFAULT_API_URL}" do
    expect(Cronjob::Client::DEFAULT_API_URL).to eq(Cronjob::Client::URL + Cronjob::Client::API_VERSION)
  end
  it 'has a connection' do
    expect(Cronjob::Client.new).to respond_to(:conn)
  end
  describe "#conn" do
    [:get, :post, :delete, :patch, :put].each do |http_method|
      it "should respond to #{http_method}" do
        expect(conn).to respond_to(http_method)
      end
    end
  end

end
