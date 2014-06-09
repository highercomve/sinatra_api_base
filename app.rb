require 'sinatra/base'
require 'json'
# require "sinatra/cookies"
# require 'mongoid'
# require 'omniauth'
# require 'omniauth-github'
# require 'omniauth-facebook'
# require 'omniauth-twitter'

# Mongoid.load!("config/mongoid.yml")

# Load every app file, controllers and models
%w(libs/*.rb app/models/*.rb).each do |dir|
  Dir.glob(dir).each do |file|
    require_relative file
  end
end

class App < Sinatra::Base
  # helpers Sinatra::Cookies
  # include SessionsHelper
  # enable :protection , :except => :ip_spoofing
  configure do
    enable :sessions
    set :session_secret, 'asdfa2342923422f1adc05c837fa234230e3594b93824b00e930ab0fb94b'
    set :root, File.dirname(__FILE__)
    set :protection, :except => [:remote_token, :frame_options, :http_origin]
    enable :logging, :dump_errors, :raise_errors
  end

  # use OmniAuth::Builder do
  #   provider :facebook, 'API_ID','TOKEN'
  #   provider :twitter, 'API_ID', 'TOKEN'
  # end

  before do
    content_type 'application/json', :charset => 'utf-8'
  # For api cross-domain
  #   headers['Access-Control-Allow-Origin'] = '*'
  #   headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS, DELETE, PUT'
  #   headers['Access-Control-Allow-Headers'] = 'Content-Type,X-Requested-With, X-Prototype-Version, X-CSRF-Token, Origin, Accept'
  end

  get '/' do
    "Hello World"
  end
end

# Request controllers
# Dir.glob("app/controllers/*.rb").each do |file|
#   require_relative file
# end
#
# class App
#   run! if app_file == $0
# end
