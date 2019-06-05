require 'net/http'
require 'json'

class DataImportService
  attr_reader :owner, :repo, :author_email

  def initialize(params)
    @owner = params[:owner].gsub(/\p{Cyrillic}/, '')
    @repo = params[:repo].gsub(/\p{Cyrillic}/, '')
    @author_email = params[:author_email].gsub(/\p{Cyrillic}/, '')
  end

  def get_commits
    url = "https://api.github.com/repos/#{owner}/#{repo}/commits?author=#{author_email}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
