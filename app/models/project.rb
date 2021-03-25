class Project < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :code_snippets
  has_one :my_gist
end
