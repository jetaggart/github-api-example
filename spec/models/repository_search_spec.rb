require 'spec_helper'

describe RepositorySearch do
  describe "#results" do
    it "returns an array" do
      repository_search = RepositorySearch.new(:results => '[{"id": 1, "name": "something"}, {"id": 2, "name": "something else"}]')

      expect(repository_search.results).to match_array([
                                                         {'id' => 1, 'name' => "something"},
                                                         {'id' => 2, 'name' => "something else"},
                                                       ])
    end
  end
end