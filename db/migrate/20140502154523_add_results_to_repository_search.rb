class AddResultsToRepositorySearch < ActiveRecord::Migration
  def change
    add_column :repository_searches, :results, :text
  end
end
