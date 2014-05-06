class GithubApi
  def repositories(options)
    username = options.fetch(:username)

    get("/users/#{username}/repos")
  end

  def issues(options)
    username = options.fetch(:username)
    id       = options.fetch(:id)

    result = get("/repos/#{username}/#{id}/issues")
  end

  def create_issue(options)
    username = options.fetch(:username)
    id       = options.fetch(:id)
    title    = options.fetch(:title)

    post("/repos/#{username}/#{id}/issues", :title => title)
  end

  private

  def get(url)
    conn.get(url).body
  end

  def post(url, body)
    conn.post(url, body.to_json).body
  end

  def conn
    Faraday.new(:url => "https://api.github.com") do |faraday|
      faraday.adapter(Faraday.default_adapter)
      faraday.basic_auth(ENV["GITHUB_USERNAME"], ENV["GITHUB_PASSWORD"])
    end
  end
end