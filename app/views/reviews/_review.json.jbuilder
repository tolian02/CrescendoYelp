json.extract! review, :id, :review_id, :review_rating, :user_id, :user_profile_url, :user_image_url, :user_name, :review_text, :review_time_created, :review_url, :created_at, :updated_at
json.url review_url(review, format: :json)
