class Notification < ApplicationRecord
  belongs_to :associatable, polymorphic: true

  TYPE_TASK_ASSIGNMENT = 'task_assignment'
  TYPE_COMMENT = 'comment'
  TYPE_STATUS_CHANGED = 'status_changed'
  TYPE_COMPANY_INVITATION = 'invitation_to_company'

  def self.create_notification(from, to, type, related_object)
    Notification.create!(sender_id: from.id, user_id: to.id, notification_type: type, associatable: related_object, old: false)
  end

  def self.get_old_notifications(user)
    Notification.where(user_id: user.id, old: true)
  end

  def self.get_new_notifications(user)
    Notification.where(user_id: user.id, old: false)
  end

  def get_notification_text
    case self.notification_type
    when TYPE_TASK_ASSIGNMENT
      I18n.t('notification.task_assignment', user: User.find(self.sender_id).full_name)
    when TYPE_COMMENT
      I18n.t('notification.comment', user: User.find(self.sender_id).full_name)
    when TYPE_STATUS_CHANGED
      I18n.t('notification.status_changed', user: User.find(self.sender_id).full_name)
    when TYPE_COMPANY_INVITATION
      I18n.t('notification.invitation_to_company', user: User.find(self.sender_id).full_name)
    end
  end

  def get_notification_url
    case self.notification_type
    when TYPE_COMPANY_INVITATION
      "/companies/#{self.associatable.company_id}"
    end
  end

end
