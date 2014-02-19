require 'test_helper'

describe 'Client' do
  before do
    @key = '03a82de6de2d939564aa607b0e24a030b5047c54ed87c77fea'
    @client = TalentLMS::Client.new({
      :api_key => @key,
      :sub_domain => 'example'
    })
  end

  describe '#initialize' do
    it 'api_key is a required field' do
      err = -> {
        TalentLMS::Client.new(:sub_domain => '')
      }.must_raise ArgumentError
      err.message.must_match /api_key/
    end

    it 'subdomain is a required field' do
      err = -> {
        TalentLMS::Client.new(:api_key => '')
      }.must_raise ArgumentError
      err.message.must_match /sub_domain/
    end
  end

  describe '#auth_header' do
    it 'adds auth header without white space' do
      expected = 'Basic MDNhODJkZTZkZTJkOTM5NTY0YWE2MDdiMGUyNGEwMzBiNTA0N2M1NGVkODdjNzdmZWE6'
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
end
