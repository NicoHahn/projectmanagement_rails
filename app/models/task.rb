class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :notifications, as: :associatable
end
