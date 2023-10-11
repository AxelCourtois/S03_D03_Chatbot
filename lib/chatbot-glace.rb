require 'http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load 




api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-babbage-001/completions"


headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}


data = {
  "prompt" => "5 goûts de glace",
  "max_tokens" => 50,
  "temperature" => 0.5
}



response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip




puts "Voici 5 parfums de glace :"
puts response_string