# -*- coding: utf-8 -*-
require 'sinatra'
require 'haml'
require 'sass'
require 'coffee-script'
require 'redis'

$redis = Redis.new

set :port, 8182
# set :environment, :production

not_found do
  @title = "404"
  myhaml :not_found
end

error do
  @title = "error.."
  myhaml :error
end

get '/' do
  myhaml :index 
end

FILES = `find views`.split
puts FILES
def check_file file, ext
  FILES.member? "views/#{file}#{ext}"
end

get /\/([\w\/]+).css/ do |match|
  return 404 unless check_file match, '.sass'
  sass match.to_sym 
end
get /\/([\w\/]+).js/ do |match|
  return 404 unless check_file match, '.coffee'
  coffee match.to_sym 
end
get /\/([\w\/]+)/ do |match|
  return 404 unless check_file match, '.haml'
  myhaml match.to_sym 
end

def myhaml target, args={}
  args.merge! :layout => false if params[:_pjax]
  haml target, args
end

def link_to name, link, pjax=""
  pjax = "class=\"js-pjax\"" unless pjax == ""
  "<a href=\"#{link}\"#{pjax}>#{name}</a>"
end

