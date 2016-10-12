#!/usr/bin/env ruby
# coding:utf-8
require 'sinatra'
require 'sinatra/json'
require 'json'

require './speech.rb'

# API

get '/api/v1/speech/test' do
  speech = Speech.new
  data = {result: speech.do_speech("これはテストです．音量などを確認してください．")}
  if data[:result] == 'success' then
    status 200
  else
    status 400
  end
  json data
end

post '/api/v1/speech', provides: :json do
  params = JSON.parse(request.body.read,  {:symbolize_names => true})
  text = params[:text]
  speech = Speech.new
  data = {result: speech.do_speech(text)}
  if data[:result] == 'success' then
    status 200
  else
    status 400
  end
  json data
end