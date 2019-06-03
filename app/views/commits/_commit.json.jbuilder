json.extract! commit, :id, :commiter_name, :commiter_email, :message, :commit_url, :profile_url, :commit_date, :created_at, :updated_at
json.url commit_url(commit, format: :json)
