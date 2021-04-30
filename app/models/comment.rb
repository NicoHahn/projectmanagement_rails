class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :task

  def self.create_comment(text)
    # TODO create comment with current user as author.
  end

end
