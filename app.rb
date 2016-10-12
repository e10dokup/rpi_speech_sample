#!/usr/bin/env ruby
# coding:utf-8
require 'sinatra'
require './speech.rb'

# API

get '/api/v1/speech/test' do
  speech = Speech.new
  speech.do_speech "これはテストです．音量などを確認してください．"
end

post 'api/v1/speech' do

end