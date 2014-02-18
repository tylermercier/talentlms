require 'test_helper'

describe 'Client' do
  before do
    @key = '03a82de6de2d939564aa607b0e24a030b5047c54ed87c77fea'
    @client = TalentLMS::Client.new({
      :api_key => @key,
      :sub_domain => 'example'
    })
    @headers = {
      'Authorization' => 'Basic MDNhODJkZTZkZTJkOTM5NTY0YWE2MDdiMGUyNGEwMzBiNTA0N2M1NGVkODdjNzdmZWE6',
      'Host' => 'example.talentlms.com',
      'User-Agent' => 'RubyHTTPGem/0.5.0'
    }
  end

  describe '#auth_header' do
    it 'adds auth header without white space' do
      expected = @headers["Authorization"]
      assert_equal expected, @client.auth_header(@key)["Authorization"]
    end
  end

  describe '#route_for_method' do
    it 'creates index route' do
      expected = 'https://example.talentlms.com/api/v1/users'
      assert_equal expected, @client.route_for_method('users')
    end

    it 'creates index route with argument' do
      expected = 'https://example.talentlms.com/api/v1/users/id:1'
      assert_equal expected, @client.route_for_method('users', :id => 1)
    end

    it 'creates index route with arguments' do
      expected = 'https://example.talentlms.com/api/v1/usersetstatus/user_id:1,status:ok'
      assert_equal expected, @client.route_for_method('usersetstatus', :user_id => 1, :status => 'ok')
    end
  end

  describe 'API' do
    it 'finds user by id' do
      stub_request(:get, "https://example.talentlms.com/api/v1/users/id:1").
        with(:headers => @headers).
        to_return(:status => 200, :body => "{\"id\": 1}", :headers => {})

      expected = {"id" => 1}
      assert_equal expected, @client.users(:id => 1)
    end
  end
end
