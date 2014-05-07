require 'spec_helper'

describe RepositorySearch do
  describe "#repos" do
    it "returns an array of Repository objects" do
      repository_search = RepositorySearch.new(:results => '[{"id": 1, "name": "something"}, {"id": 2, "name": "something else"}]')

      expect(repository_search.repos.map(&:name)).to match_array(["something", "something else"])
    end
  end
end