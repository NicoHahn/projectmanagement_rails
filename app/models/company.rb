class Company < ApplicationRecord

  has_many :memberships
  has_many :users, :through => :memberships
  has_many :projects

  def users_accepted
    users = self.memberships.where(status: 'accepted').pluck(:user_id)
    User.where(id: users)
  end

end
