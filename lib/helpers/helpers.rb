require 'net/http'
require 'json'

uri = URI("https://api.github.com/gists")

payload = {
  'description' => "My test gist",
  'public' => true,
  'files' => {
    'test.txt' => {
      'content' => "This is a test!\n\nI am making a public gist."
    }
  }
}

req = Net::HTTP::Post.new(uri.path)
req.body = payload.to_json

puts req.inspect
puts req.body.inspect

# GitHub API is strictly via HTTPS, so SSL is mandatory
res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) do |http|
  http.request(req)
end

puts res.inspect
puts res.body.inspect