require 'httparty'

API_KEY = '1bcadfd2'
INVALID_API_KEY = '3rr4d0'

class HttParty
  include HTTParty
  base_uri 'http://www.omdbapi.com/'
end

RSpec.describe 'Little example of api testing using httparty and rspec' do
  it 'Should return 200 when get a valid request' do
    response = HttParty.get("?t=Batman&apikey=#{API_KEY}")
    expect(response.code).to eql(200)
  end

  it 'Should return 401 when send a invalid api key' do
    response = HttParty.get("?t=Batman&apikey=#{INVALID_API_KEY}")
    expect(response.code).to eql(401)
  end

  it 'Should return 404 when send a invalid movie' do
    response = HttParty.get("?y=2016&apikey=#{API_KEY}")
    puts response.code
    puts response.parsed_response
    expect(response[0]).to eql('{"Response":"False","Error":"Movie not found!"}')
  end
end

