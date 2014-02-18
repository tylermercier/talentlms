# Talentlms

Ruby gem for the [Talent LMS API](http://www.talentlms.com)

## Status
[![Gem Version](https://badge.fury.io/rb/talentlms.png)](http://badge.fury.io/rb/talentlms)
[![Build Status](https://secure.travis-ci.org/tylermercier/talentlms.png)](http://travis-ci.org/tylermercier/talentlms)
[![Code Climate](https://codeclimate.com/github/tylermercier/talentlms.png)](https://codeclimate.com/github/tylermercier/talentlms)

## Installation

Add this line to your application's Gemfile:

    gem 'talentlms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install talentlms

## Usage

    @client = TalentLMS::Client.new({
      :api_key => '03a82de6de2d939564aa607b0e24a030b5047c54ed87c77fea',
      :sub_domain => 'example'
    })

    @client.users

    @client.users(:id => 1)

    @client.users(:email => 'tyler@example.com')

    @client.courses

    @client.courses(:id => 1)

    @client.categories

    @client.categories(:id => 1)

    @client.groups

    @client.groups(:id => 1)

    @client.branches

    @client.branches(:id => 1)

    @client.siteinfo

    @client.siteinfo

    @client.userlogin

    @client.userlogout

    @client.usersignup

    @client.usersetstatus(:user_id =>1, status => 'complete')

    @client.forgotusername(email => 'tyler@example.com', domain_url => 'http://www.example.com/login')

    @client.forgotpassword(username => 'tyler', domain_url => 'http://www.example.com', redirect_url => 'http://www.example.com/login')

    @client.addusertocourse

    @client.addusertobranch(:user_id => 1, :branch_id => 111)

    @client.addcoursetobranch(:course_id => 1, :branch_id => 111)

    @client.addusertogroup(:user_id => 1, :group_key => 12)

    @client.removeuserfromgroup(:user_id => 1, :group_id => 12)

    @client.addcoursetogroup(:course_id => 1, :group_id => 12)

    @client.gotocourse(:user_id => 1, :course_id => 1)

    @client.buycourse

    @client.buycategorycourses

    @client.getcustomregistrationfields

    @client.categoryleafsandcourses(:id => 3)

    @client.getusersprogressinunits(:unit_id => 56, :user_id => 1)

    @client.creategroup

    @client.createbranch

    @client.ratelimit

## Contributing

1. Fork it ( http://github.com/<my-github-username>/talentlms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
