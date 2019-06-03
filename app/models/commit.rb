class Commit < ApplicationRecord

  def self.load(search_params)
    response = DataImportService.new(search_params).get_commits
    response.each do |com|
      commit = Commit.new(
        commiter_name: com["commit"]["author"]["name"],
        commiter_email: com["commit"]["author"]["email"],
        message: com["commit"]["message"],
        commit_url: com["html_url"],
        profile_url: com["author"]["html_url"],
        commit_date:  com['commit']["author"]["date"]
      )
      commit.save
    end
  end
end
