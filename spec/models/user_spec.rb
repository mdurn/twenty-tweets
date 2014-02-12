require 'spec_helper'

describe User do
  let(:user) {Fabricate(:user)}

  describe "#log_twitter_search!" do
    it 'creates a TwitterSearchQuery record associated with the user' do
      TwitterSearchQuery.count.should == 0
      user.log_twitter_search!('test')
      TwitterSearchQuery.count.should == 1
      TwitterSearchQuery.last.user_id.should == user.id
    end
  end
end
