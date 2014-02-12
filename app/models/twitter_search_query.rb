class TwitterSearchQuery < ActiveRecord::Base

  validates_presence_of :user_id
  validates_presence_of :query

  belongs_to :user
end
