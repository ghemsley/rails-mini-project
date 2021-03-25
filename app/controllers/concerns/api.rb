require_relative '../../../config/environment'
require 'net/http'
require 'json'

class API
  def self.request(*code_snippets)
    token = ENV['GIST_TOKEN']
    uri = URI('https://api.github.com/gists')
    request = Net::HTTP::Post.new(uri)
    request.basic_auth(ENV['GIST_USER'], token)
    request.set_form_data(files: [*code_snippets].collect { |snippet| [snippet.name, snippet.code] }.to_h)

    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(request)
    end
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      json(response.body)
    else
      res.value
    end
  end
end
