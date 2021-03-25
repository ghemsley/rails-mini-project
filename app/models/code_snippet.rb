class CodeSnippet < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :project, optional: true
  belongs_to :my_gist, optional: true
end
