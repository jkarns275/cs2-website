require "./cs2-website/*"
require "kemal"
require "file"

def index
  File.read("./views/index.html")
end
def cs2index
  File.read("./views/cs2/index.html")
end

error 404 do
  "But there was nothing to be found..."
end

get "/"do
  index
end

get "/cs2" do
  cs2index
end

# routing for cs2/java/*, cs2/output/*, and cs2/projects/*
get "/cs2/:dir/:file" do |env|
  dir = env.params.url["dir"]
  file = env.params.url["file"]
  if File.exists?("views/cs2/#{dir}/#{file}.html")
    File.read("views/cs2/#{dir}/#{file}.html")
  else
    "But there was nothing to be found..."
  end
end

Kemal.run
