class Task < ApplicationRecord
  
  # right below we are creating an association method
  belongs_to :user

  # here are the enums that we
  enum({ :category => { :work => 0, :family => 1, :school => 2, :other => 3 } })
  enum({ :priority => { :high => 0, :medium => 1, :low => 2 } })

end
