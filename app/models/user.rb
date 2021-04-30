class User < ApplicationRecord

  has_secure_password
  has_many :tasks
  has_many :notifications
  has_many :memberships
  has_many :companies, through: :memberships
  has_many :comments

  validates :email,
            format: { with: /(.+)@(.+)/, message: "Email invalid" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }

  def full_name
    self.firstname + " " + self.lastname
  end

end
