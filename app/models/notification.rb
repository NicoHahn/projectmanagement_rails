class Notification < ApplicationRecord
  belongs_to :associatable, polymorphic: true

  TYPE_TASK_ASSIGNMENT = 'task_assignment'
  TYPE_COMMENT = 'comment'
  TYPE_STATUS_CHANGED = 'status_changed'

  def create_notificaiton(from, to, type, related_object)
    Notification.create!(sender_id: from.id, user_id: to.id, notification_type: type, associatable: related_object)
  end

end
