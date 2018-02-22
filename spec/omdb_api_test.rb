require 'httparty'

class HttParty
  include HTTParty
  base_uri 'http://www.omdbapi.com/'

  API_KEY = '1bcadfd2'
end


RSpec.describe 'Little example of api testing using httparty and rspec' do
  it 'Should return 200 when get a valid request' do
    response = HttParty.get('?t=Batman&apikey=API_KEY')
    expect(response.code).to eql(200)
  end
end