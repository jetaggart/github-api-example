class RepositorySearch < ActiveRecord::Base
  def results
    JSON.parse(
      read_attribute(:results)
    )
  end
end
