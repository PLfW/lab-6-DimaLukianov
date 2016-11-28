json.extract! lesson, :id, :day, :lesson_number, :odd_week, :subgroup, :type, :classroom, :user_id, :subject_id, :created_at, :updated_at
json.url lesson_url(lesson, format: :json)