class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :notifications, as: :associatable

  enum status: [ :planned, :to_do, :in_progress, :in_review, :approved, :done ]

end
