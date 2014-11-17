#!/usr/bin/env ruby

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sass'
require './lib/dao'
require './lib/scorer'

set :bind, '0.0.0.0'

get "/" do
  erb :home
end

get "/mumble" do
  erb :mumble
end

get "/stats" do
  @objective = params["objective"]
  @objectives = get_objectives
  @sorted_objectives = @objectives.sort_by { |name, objective| objective.display_name }
  erb :stats
end

get "/map" do
  File.read(File.join('public', 'index.html'))
end

get "/styles.css" do
  scss :styles
end

not_found do
  @title = '404 Missing'
  case rand( 5 )
  when 1
    @message = 'Looks like your lost in dickyince\'s zoo.'
  when 2
    @message = 'Looks like your too late, Redplague has alreay burnt your house down!'
  when 3
    @message = 'Not found, like all that stuff Utopia1138 left in his chests.'
  when 4
    @message = 'The page seems to have wandered off, probably looking for toothball.'
  when 5
    @message = 'Don\'t know.'
  end
  erb :missing
end
