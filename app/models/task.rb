class Task < ApplicationRecord
  
  # right below we are creating an association method
  belongs_to :user

  # now whenever we create a new task, it should be set as "false" (meaning not complete) in default
  before_create :set_default_status

  def set_default_status
    self.completed = false
  end

  # here are the enums that we
  enum({ :category => { :work => 0, :family => 1, :school => 2, :other => 3 } })
  enum({ :priority => { :high => 0, :medium => 1, :low => 2 } })

end
