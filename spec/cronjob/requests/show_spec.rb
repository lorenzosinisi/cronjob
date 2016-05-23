require 'spec_helper'

describe Cronjob::Show do
  let(:args) do
    { id: 32 }
  end
  let(:endpoint) { 'show' }
  it 'is loaded' do
    expect(Cronjob::Show).to be
  end
  it "has /#{Cronjob::Show::ENDPOINT} as endpoint" do
    expect(Cronjob::Show::ENDPOINT).to eq(endpoint)
  end
  context 'success deletes the job' do
    before do
    stub_request(
      :get,
      "https://www.guardiano.pm/api/v1/show?auth_token=#{Cronjob.configuration.token}&id=#{args[:id]}"
      ).to_return(
        :status => 200,
        :body => {
          "job" => [
            {
              "id" => args[:id],
              "name" => "A test one",
              "cron" => "* * * * *",
              "action" => "get",
              "url" => "http://google.name",
              "params" => "some=token",
              "user_id" => 8,
              "created_at" => "2016-05-23T16:07:10.090+02:00",
              "updated_at" => "2016-05-23T16:07:10.090+02:00"
            }
          ]
        }.to_json,
        :headers => {}
      )
    end
    it "shows the information about the cronjob" do
      expect(described_class.new(args).response['job']).to_not be_nil
    end
  end
end
