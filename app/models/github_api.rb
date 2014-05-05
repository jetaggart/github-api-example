class GithubApi
  def repositories(options)
    username = options.fetch(:username)

    request("https://api.github.com/users/#{username}/repos")
  end

  def issues(options)
    username = options.fetch(:username)
    id = options.fetch(:id)

    request("https://api.github.com/repos/#{username}/#{id}/issues")
  end

  private

  def request(url)
    Faraday.get(url).body
  end
end