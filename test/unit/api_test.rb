require 'test_helper'

describe 'API' do
  before do
    TalentLMS.init({
      :api_key => '03a82de6de2d939564aa607b0e24a030b5047c54ed87c77fea',
      :sub_domain => 'example'
    })
    @headers = {
      'Authorization' => 'Basic MDNhODJkZTZkZTJkOTM5NTY0YWE2MDdiMGUyNGEwMzBiNTA0N2M1NGVkODdjNzdmZWE6',
      'Host' => 'example.talentlms.com',
      'User-Agent' => 'RubyHTTPGem/0.5.0'
    }
  end

  it 'GET users' do
    stub_request(:get, "https://example.talentlms.com/api/v1/users")
      .with(:headers => @headers)
      .to_return(:status => 200, :body => "[{\"id\": 1}, {\"id\": 2}]", :headers => {})

    expected = [{"id" => 1}, {"id" => 2}]
    assert_equal expected, TalentLMS.users
  end

  it 'GET user' do
    stub_request(:get, "https://example.talentlms.com/api/v1/users/id:1")
      .with(:headers => @headers)
      .to_return(:status => 200, :body => "{\"id\": 1}", :headers => {})
    expected = {"id" => 1}
    assert_equal expected, TalentLMS.users(:id => 1)
  end

  it 'GET course' do
    stub_request(:get, "https://example.talentlms.com/api/v1/courses/id:5")
      .with(:headers => @headers)
      .to_return(:status => 200, :body => "{\"id\": 5}", :headers => {})
    expected = {"id" => 5}
    assert_equal expected, TalentLMS.courses(:id => 5)
  end

  it 'throws exception with details on error' do
    error_message = "{\"error\":{\"type\": \"invalid_request_error\", \"message\": \"Invalid arguments provided\"}}"
    stub_request(:get, "https://example.talentlms.com/api/v1/courses/id:5")
      .with(:headers => @headers)
      .to_return(:status => 200, :body => error_message, :headers => {})

    err = -> {
      TalentLMS.courses(:id => 5)
    }.must_raise TalentLMS::ApiError
    err.message.must_match /Invalid arguments provided/
  end
end
