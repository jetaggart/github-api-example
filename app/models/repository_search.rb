class RepositorySearch < ActiveRecord::Base
  def repos
    JSON.parse(results).map { |result| Repository.new(result) }
  end
end
