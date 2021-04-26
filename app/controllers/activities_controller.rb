class ActivitiesController < ApplicationController

  before_action :set_activities
  after_action :update_activities

  def index
  end

  private
  def set_activities
    @old_activities = Notification.get_old_notifications(current_user)
    @new_activities = Notification.get_new_notifications(current_user)
  end

  def update_activities
    @new_activities.update_all(old: true)
  end

end
