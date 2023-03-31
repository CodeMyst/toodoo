class Todo < ApplicationRecord
  belongs_to :user

  after_initialize :set_defaults, unless: :persisted?

  def set_defaults
    self.completed = false if self.completed.nil?
  end
end
