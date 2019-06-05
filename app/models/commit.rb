class Commit < ApplicationRecord
  paginates_per 10

  def self.load(search_params)
    data_clean_up(search_params) if Commit.any? && search_params.present?
    response = DataImportService.new(search_params).get_commits
    unless response_check(response)
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

  def self.response_check(response)
    response["message"] == "Not Found" if response.class == Hash
  end
  
  def self.data_clean_up(search_params)
    Commit.delete_all
  end
end
