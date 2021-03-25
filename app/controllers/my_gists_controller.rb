require 'gist'
require 'json'

class MyGistsController < ApplicationController
  def index
    @gists = MyGist.all
  end

  def show
    @gist = MyGist.find(params[:id])
  end

  def new
    @gist = MyGist.new
    @user = current_user
  end

  def create
    gist = MyGist.new(my_gist_params(:name, :description, :project_id))
    project = Project.find(params[:my_gist][:project_id])
    snippet_ids = if params[:code_snippets]
                    params[:code_snippets].collect do |snippet_id|
                      project.code_snippets.find(snippet_id)
                    end
                  else
                    project.code_snippets.collect(&:id)
                  end
    code_snippets = CodeSnippet.all.select do |snippet|
      snippet_ids.include?(snippet.id)
    end
    code_snippets.each do |snippet|
      snippet.my_gist = gist
      snippet.save
    end
    response = my_gist_request(code_snippets, gist.description, gist.name)
    gist.url = response['html_url'] if response['html_url']
    if gist.save
      redirect_to my_gist_path(gist)
    else
      redirect_to new_my_gist_path
    end
  end

  def edit
    @gist = MyGist.find(params[:id])
    @user = current_user
  end

  def update
    gist = MyGist.find(params[:id])
    if gist.update(my_gist_params(:name, :description, :project_id))
      redirect_to my_gist_path(gist)
    else
      redirect_to edit_my_gist_path(gist)
    end
  end

  def destroy
    gist = MyGist.find(params[:id])
    if gist.destroy
      redirect_to my_gists_path
    else
      redirect_to edit_my_gist_path(gist)
    end
  end

  private

  def my_gist_params(*args)
    params.require(:my_gist).permit(*args)
  end

  def my_gist_request(code_snippets, gist_description, filename)
    token = ENV['GIST_TOKEN']
    Gist.multi_gist(code_snippets.to_h do |snippet|
                      ["#{snippet.name}.jsx", snippet.code]
                    end.to_h, filename: filename, description: gist_description, access_token: token, public: true)
  end
end
