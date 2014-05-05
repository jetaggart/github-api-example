class RepositoryIssuesController < ApplicationController
  def index
    @repository_issues = JSON.parse GithubApi.new.issues(:username => params[:username],
                                                         :id => params[:id])
  end
end