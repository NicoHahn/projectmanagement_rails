class Membership < ApplicationRecord

  belongs_to :user
  belongs_to :company

  enum status: [ :pending, :accepted, :declined ]

  def self.create_invitation(company, user, status, current_user)
    membership = Membership.create(company_id: company.id, user_id: user.id, status: status)
    if membership
      Notification.create_notification(current_user, user, Notification::TYPE_COMPANY_INVITATION, membership )
    end
  end

end
