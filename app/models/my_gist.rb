class MyGist < ApplicationRecord
  belongs_to :project, optional: true
  has_many :code_snippets
end
