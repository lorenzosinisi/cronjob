require 'spec_helper'

describe Cronjob::List do
  let(:args) do
    { }
  end
  let(:endpoint) { 'list' }
  it 'is loaded' do
    expect(Cronjob::List).to be
  end
  it "has /#{Cronjob::List::ENDPOINT} as endpoint" do
    expect(Cronjob::List::ENDPOINT).to eq(endpoint)
  end
  context 'success shows the list' do
    before do
    stub_request(:get, "https://www.guardiano.pm/api/v1/list?auth_token=#{Cronjob.configuration.token}").
         to_return(:status => 200, :body =>
          { "list": [
            {
              "id" => 32,
              "cron" => "* * * * *",
              "action" => "get",
              "url" => "http://google.com"
            }
          ]
        }.to_json, :headers => {})
    end
    it "shows the list in a json format" do
      expect(described_class.new(args).response).to eq("list" => [{"id"=>32, "cron"=>"* * * * *", "action"=>"get", "url"=>"http://google.com"}])
    end
  end
end
