FactoryBot.define do
  factory :commit do
    commiter_email { 'itsmatyukhin@gmail.com' }
    message        { 'idk just some text' }
    commit_url     { 'www.github.com' }
    profile_url    { 'www.github.com/adomant'}
    commit_date    { '2019-06-01 15:42:49' }
  end
end
