class Repository
  def initialize(repo_hash)
    @repo_hash = repo_hash
  end

  def name
    @repo_hash["name"]
  end
end