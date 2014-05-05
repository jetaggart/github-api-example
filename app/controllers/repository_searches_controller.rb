class RepositorySearchesController < ApplicationController
  def new
    @repository_search = RepositorySearch.new
  end

  def show
    @repository_search = RepositorySearch.find(params[:id])
  end

  def index
    @repository_searches = RepositorySearch.all
  end

  def create
    search_results = GithubApi.new.repositories(:username => repository_search_params[:username])

    @repository_search = RepositorySearch.new(
        repository_search_params.merge(:results => search_results)
    )

    @repository_search.save!

    redirect_to repository_search_path(@repository_search.id)
  end

  def repository_search_params
    params.require(:repository_search).permit(:username)
  end
end
