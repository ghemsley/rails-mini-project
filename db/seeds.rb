# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: 'Graham', password: 'password')
Project.create(name: 'Project 1', description: 'Default project')
ProjectsUsers.create(user_id: 1, project_id: 1)
MyGist.create(name: 'Gist 1', description: 'Default gist', url: 'https://www.example.com/', project_id: 1)
CodeSnippet.create(name: 'Code snippet 1', code: 'render(<h1>Hello world!</h1>)', user_id: 1, project_id: 1, my_gist_id: 1)
