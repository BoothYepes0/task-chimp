class Task < ApplicationRecord
  enum({ :category => { :work => 0, :family => 1, :school => 2, :other => 3 } })
  enum({ :priority => { :high => 0, :medium => 1, :low => 2 } })

end
