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
  "prompt" => "Donne moi des étapes d'une recette de cuisine",
  "max_tokens" => 200,
  "temperature" => 0.5
}



response = HTTP.post(url, headers: headers, body: data.to_json)
response_body = JSON.parse(response.body.to_s)
response_string = response_body['choices'][0]['text'].strip




puts "Voici ta super recette de cuisine :"
puts response_string