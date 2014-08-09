class User < ActiveRecord::Base
  has_secure_password

  has_many :received_hugs, class_name: "Hug", foreign_key: :receiver_id
  has_many :given_hugs, class_name: "Hug", foreign_key: :giver_id

  validates :email, presence: true
end
