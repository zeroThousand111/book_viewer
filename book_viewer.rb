require "sinatra"
require "sinatra/reloader"
require "tilt/erubi"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @contents = File.readlines("data/toc.txt")

  erb :home
end

get "/chapters/1" do
  @title = "Chapter 1"
  @contents = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp1.txt")

  erb :chapter
end

get "/show/:name" do
  params[:name]
end

get "/chapters/:number" do
  @contents = File.readlines("data/toc.txt")

  number = params[:number].to_i
  chapter_name = @contents[number - 1]
  @title = "Chapter #{number}: #{chapter_name}"

  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end
