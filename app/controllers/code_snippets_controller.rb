class CodeSnippetsController < ApplicationController
  def index
    @code_snippets = CodeSnippet.all
  end

  def show
    @code_snippet = CodeSnippet.find(params[:id])
  end

  def new
    @code_snippet = CodeSnippet.new
    @user = current_user
  end

  def create
    code_snippet = CodeSnippet.new(code_snippet_params(:name, :code, :project_id, :user_id))
    if code_snippet.save
      redirect_to code_snippet_path(code_snippet)
    else
      redirect_to new_code_snippet_path
    end
  end

  def edit
    @code_snippet = CodeSnippet.find(params[:id])
    @user = current_user
  end

  def update
    code_snippet = CodeSnippet.find(params[:id])
    if code_snippet.update(code_snippet_params(:name, :code, :project_id, :user_id))
      redirect_to code_snippet_path(code_snippet)
    else
      redirect_to edit_code_snippet_path(code_snippet)
    end
  end

  def destroy
    code_snippet = CodeSnippet.find(params[:id])
    if code_snippet.destroy
      redirect_to code_snippets_path
    else
      redirect_to code_snippet_path(code_snippet)
    end
  end

  private

  def code_snippet_params(*args)
    params.require(:code_snippet).permit(*args)
  end
end
