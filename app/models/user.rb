class User < ApplicationRecord
  has_secure_password
  has_and_belongs_to_many :projects
  has_many :code_snippets
end
