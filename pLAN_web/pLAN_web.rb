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
  @user = get_missing_user
  erb :missing
end
