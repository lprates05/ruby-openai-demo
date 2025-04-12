# Write your solution here!

require "dotenv/load"
require "openai"

client = OpenAI::Client.new(access_token: ENV.fetch("MY_KEY"))


# Set up the conversation

intro_message = "Hello! How can I help you today?\n"
space_message = "--------------------------------------------------"
content_info = puts intro_message + space_message

user_answer = "where's the best pizza place in Chicago?" #gets.chomp.capitalize

chat_completion = [
  {
   "role" => "system",
    "content" => "Hello! How can I help you today?\n--------------------------------------------------"
  },
  {
    "role" => "user",
    "content" => gets.chomp.capitalize 
  }
]


#Call the API to get the next message from GPT
api_response = client.chat(
  parameters: {
   model: "gpt-3.5-turbo",
    messages: chat_completion
  }
)

#Print API Response
api_choices = api_response.fetch("choices")
api_message = api_choices.at(0).fetch("message")
chat_response = api_message.fetch("content")
puts chat_response
pp space_message

#Loop of interactions

user_reply = gets.chomp.capitalize

if user_reply != "bye"
  api_response = client.chat(
    parameters: {
     model: "gpt-3.5-turbo",
      messages: chat_completion
    }
  )
  puts chat_response
  pp space_message
  else
end
