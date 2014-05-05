require 'spec_helper'

describe GithubApi do
  let(:github_api) { GithubApi.new }

  describe "#respositories" do
    it "returns the repositories for jetaggart" do
      VCR.use_cassette 'github/users/jetaggart/repositories' do
        results = JSON.parse github_api.repositories(:username => 'jetaggart')

        names = results.map { |result| result['name'] }

        expect(names).to include('batch-api-example')
        expect(names).to include('light-haskell')
      end
    end

    it "returns the right repositories for durhamka" do
      VCR.use_cassette 'github/users/durhamka/repositories' do
        results = JSON.parse github_api.repositories(:username => 'durhamka')

        names = results.map { |result| result['name'] }

        expect(names).to include('anagram-kata')
        expect(names).to include('bank-ocr-kata')
      end
    end
  end
end