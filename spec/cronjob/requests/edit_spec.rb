require 'spec_helper'

describe Cronjob::Edit do
  let(:args) do
    {
      action: :post,
      cron: '12121 * * */20',
      url: 'http://rspec.com',
      params: 'something=true'
    }
  end
  let(:endpoint) { 'edit' }
  it 'is loaded' do
    expect(Cronjob::Edit).to be
  end
  it "has /#{Cronjob::Edit::ENDPOINT} as endpoint" do
    expect(Cronjob::Edit::ENDPOINT).to eq(endpoint)
  end
  context 'success it will run' do
    before do
    stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
           to_return(
            :status => 200,
            :body => {
                "modified" => true,
                "job" => {
                  "id" => 35,
                  "name" => "8",
                  "cron" => "* * * * *",
                  "action" => "post",
                  "url" => "http://ciao.com",
                  "params" => "ciao=true",
                  "user_id" => 8,
                  "created_at" => "2016-05-23T16:07:10.090+02:00",
                  "updated_at" => "2016-05-23T16:17:51.862+02:00"
                }
              }.to_json,
            :headers => {}
            )
    end
    it "returns affermative response and when it will run in human words" do
      expect(described_class.new(args).response).to eq("job" => {"id"=>35, "name"=>"8", "cron"=>"* * * * *", "action"=>"post", "url"=>"http://ciao.com", "params"=>"ciao=true", "user_id"=>8, "created_at"=>"2016-05-23T16:07:10.090+02:00", "updated_at"=>"2016-05-23T16:17:51.862+02:00"}, "modified" => true)
    end
  end
  context 'faliure' do
    context 'params are missing' do
      before do
      stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
             to_return(
              :status => 200,
              :body => { "error" => "action is missing, cron is missing, url is missing" }.to_json,
              :headers => {}
              )
      end
      it 'should return error for missing params' do
        expect(described_class.new(args).response).to eq("error" => "action is missing, cron is missing, url is missing")
      end
    end
    context 'invalid token' do
      before do
      stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
             to_return(
              :status => 200,
              :body => { "error" => "Token invalid" }.to_json,
              :headers => {}
              )
      end
      it 'should return error Token invalid' do
        expect(described_class.new(args).response).to eq("error" => "Token invalid")
      end
    end
    context 'invalid cronline' do
      before do
      stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
             to_return(
              :status => 200,
              :body => { "error" => "Validation failed: Cron 'cron' -> 12121 * * */20: not a valid cronline : '12121 * * */20'" }.to_json,
              :headers => {}
              )
      end
      it 'should return error Cronline invalid' do
        expect(described_class.new(args).response).to eq("error" => "Validation failed: Cron 'cron' -> 12121 * * */20: not a valid cronline : '12121 * * */20'")
      end
    end
    context 'invalid action' do
      let(:args) do
        {
          action: :nonhttpaction,
          cron: '* * * * *',
          url: 'http://rspec.com',
          params: 'something=true'
        }
      end
      before do
      stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
             to_return(
              :status => 200,
              :body => { "error" => "Validation failed: Action nonhttpaction is not a valid HTTP action, available actions [\"get\", \"post\", \"delete\", \"patch\", \"put\", \"delete\"]" }.to_json,
              :headers => {}
              )
      end
      it 'should return error invalid action' do
        expect(described_class.new(args).response).to eq("error" => "Validation failed: Action nonhttpaction is not a valid HTTP action, available actions [\"get\", \"post\", \"delete\", \"patch\", \"put\", \"delete\"]")
      end
    end
    context 'invalid url' do
      let(:args) do
        {
          action: :get,
          cron: '* * * * *',
          url: 'SOMETHINGELSE deep dark',
          params: 'something=true'
        }
      end
      before do
      stub_request(:patch, "https://www.guardiano.pm/api/v1/edit").
             to_return(
              :status => 200,
              :body => { "error" => "Validation failed: Url is invalid" }.to_json,
              :headers => {}
              )
      end
      it 'should return error invalid URL' do
        expect(described_class.new(args).response).to eq("error" => "Validation failed: Url is invalid")
      end
    end
  end
end
