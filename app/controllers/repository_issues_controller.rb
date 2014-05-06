class RepositoryIssuesController < ApplicationController
  def index
    @repository_issues = JSON.parse GithubApi.new.issues(:username => params[:username],
                                                         :id => params[:id])

    @issue = Issue.new
  end

  def create
    GithubApi.new.create_issue(:username => params[:username],
                               :id => params[:id],
                               :title => params[:issue][:title])

    redirect_to :action => :index
  end
end