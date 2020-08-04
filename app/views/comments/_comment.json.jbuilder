json.extract! comment, :id, :body, :commenter_id, :photo_id, :schedule_time, :pin, :schedule_date, :created_at, :updated_at
json.url comment_url(comment, format: :json)
