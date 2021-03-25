# README

## Edit React code in your browser complete with live preview using these 12 weird tricks! 
### Backend developers HATE it!
###### BONUS: Impress all your friends & coworkers with automatic gist upload!

1. First you'll need to setup a bunch of stuff like nodejs, ruby, yarn, etc.
2. Then you can install the gems with `bundle install`
3. Then install the NodeJS dependencies with `yarn install` 
4. Then you'll want to set a few environment variables: 
 - First go to https://github.com/settings/tokens and generate an access token, then copy its value and create the environment variable `GIST_TOKEN=your_github_token_here`
 - Next set the variable `GIST_USER=your_github_username_here`
5. Then hopefully stuff is ready after running `rake db:migrate` so you'll want to run `yarn start` instead of `rails s`
6. Then go to default `localhost:3000/` and create a user account
7. Then sign in 
8. Then create a project at `/projects/new`
9. Then click the button that says to join that project
10. Then create some React JSX code snippets and assign them to that project, using the live preview react editor (the form will auto-update with the editor's contents)
11. Then create a new gist for that project
12. Then if all goes well you should be able to click the name of the gist to go to the generated URL for that gist and see your uploaded code snippets

Let me know if there are any issues with any of those instructions, thx
