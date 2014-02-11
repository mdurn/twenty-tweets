class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable

  validates_presence_of :password, on: :create
  validates_length_of :password, within: Devise.password_length, allow_blank: false

end
