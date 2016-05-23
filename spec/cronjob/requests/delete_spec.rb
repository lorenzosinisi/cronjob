require 'spec_helper'

describe Cronjob::Delete do
  let(:args) do
    { id: 32 }
  end
  let(:endpoint) { 'delete' }
  it 'is loaded' do
    expect(Cronjob::Delete).to be
  end
  it "has /#{Cronjob::Delete::ENDPOINT} as endpoint" do
    expect(Cronjob::Delete::ENDPOINT).to eq(endpoint)
  end
  context 'success deletes the job' do
    before do
    stub_request(
      :delete,
      "https://www.guardiano.pm/api/v1/delete?auth_token=#{Cronjob.configuration.token}&id=#{args[:id]}"
      ).to_return(
        :status => 200,
        :body => "ok",
        :headers => {}
      )
    end
    it "shows the list in a json format" do
      expect(described_class.new(args).response).to eq('ok')
    end
  end
end
