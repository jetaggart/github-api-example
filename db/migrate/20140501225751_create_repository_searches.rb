class CreateRepositorySearches < ActiveRecord::Migration
  def change
    create_table :repository_searches do |t|
      t.string :username
    end
  end
end
