json.extract! task, :id, :user_id, :completed, :task_name, :category, :priority, :created_at, :updated_at
json.url task_url(task, format: :json)
