class CreateCommits < ActiveRecord::Migration[5.2]
  def change
    create_table :commits do |t|
      t.string :commiter_name
      t.string :commiter_email
      t.string :message
      t.string :commit_url
      t.string :profile_url
      t.datetime :commit_date

      t.timestamps
    end
  end
end
