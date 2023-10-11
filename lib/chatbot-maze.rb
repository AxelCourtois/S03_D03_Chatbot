require 'http'
require 'json'
require 'pry'
require 'dotenv'
Dotenv.load 




api_key = ENV["OPENAI_API_KEY"]
url = "https://api.openai.com/v1/engines/text-davinci-003/completions"


headers = {
  "Content-Type" => "application/json",
  "Authorization" => "Bearer #{api_key}"
}


conversation_history = ""

loop do
  puts "\n"
  print "-> Vous : "
  user_input = gets.chomp

  conversation_history += user_input

  data = {
    "prompt" => "#{conversation_history}",
    "max_tokens" => 150,
    "n" => 1,
    "temperature" => 0
  }

  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)
  response_string = response_body['choices'][0]['text'].strip
  response_string = response_string.gsub("\n", "").strip

  puts "\n"
  puts "-> Bouffon : #{response_string}\n"

  conversation_history += response_string

  break if user_input.downcase == "exit"

end