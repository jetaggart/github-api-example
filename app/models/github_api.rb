class GithubApi
  def repositories(options)
    username = options.fetch(:username)

    request("https://api.github.com/users/#{username}/repos")
  end

  def request(url)
    Faraday.get(url).body
  end
end