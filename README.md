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

    TalentLMS.init({
      :api_key => '03a82de6de2d939564aa607b0e24a030b5047c54ed87c77fea',
      :sub_domain => 'example'
    })

    TalentLMS.users

    TalentLMS.users(:id => 1)

    TalentLMS.users(:email => 'tyler@example.com')

    TalentLMS.courses

    TalentLMS.courses(:id => 1)

    TalentLMS.categories

    TalentLMS.categories(:id => 1)

    TalentLMS.groups

    TalentLMS.groups(:id => 1)

    TalentLMS.branches

    TalentLMS.branches(:id => 1)

    TalentLMS.siteinfo

    TalentLMS.siteinfo

    TalentLMS.userlogin

    TalentLMS.userlogout

    TalentLMS.usersignup

    TalentLMS.usersetstatus(:user_id =>1, status => 'complete')

    TalentLMS.forgotusername(email => 'tyler@example.com', domain_url => 'http://www.example.com/login')

    TalentLMS.forgotpassword(username => 'tyler', domain_url => 'http://www.example.com', redirect_url => 'http://www.example.com/login')

    TalentLMS.addusertocourse

    TalentLMS.addusertobranch(:user_id => 1, :branch_id => 111)

    TalentLMS.addcoursetobranch(:course_id => 1, :branch_id => 111)

    TalentLMS.addusertogroup(:user_id => 1, :group_key => 12)

    TalentLMS.removeuserfromgroup(:user_id => 1, :group_id => 12)

    TalentLMS.addcoursetogroup(:course_id => 1, :group_id => 12)

    TalentLMS.gotocourse(:user_id => 1, :course_id => 1)

    TalentLMS.buycourse

    TalentLMS.buycategorycourses

    TalentLMS.getcustomregistrationfields

    TalentLMS.categoryleafsandcourses(:id => 3)

    TalentLMS.getusersprogressinunits(:unit_id => 56, :user_id => 1)

    TalentLMS.creategroup

    TalentLMS.createbranch

    TalentLMS.ratelimit

## Contributing

1. Fork it ( http://github.com/<my-github-username>/talentlms/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
