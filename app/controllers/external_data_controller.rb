require 'rubygems'
require 'json'
require 'net/http'
require 'net/https'
require 'uri'

class ExternalDataController < ApplicationController
  http_basic_authenticate_with name: "test123", password: "test123"
	respond_to 	:json, :html, :jpg, :xml
	# $uri= URI.parse('https://drowsy.badger.encorelab.org/hampshire-apps/leaf_drop_observations')
  $uri = URI.parse("http://headers.jsontest.com/")
  

   # $uri1 = URI.parse("http://droy.badger.encorelab.org/hampshire-apps")
  # def basic_auth(user, password)
  #   ActionController::HttpAuthentication::Basic.encode_credentials user, password
  # end
  def pulldata
    
      uri            = URI.parse "https://drowsy.badger.encorelab.org/hampshire-apps/leaf_drop_observations"
      # http           = Net::HTTP.new(uri.host, uri.port)
      # http.use_ssl   = true
      # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      # res            = http.get(uri.request_uri)
      # render :json => res

      Net::HTTP.start(uri.host, uri.port,
        :use_ssl => uri.scheme == 'https', 
        :verify_mode => OpenSSL::SSL::VERIFY_NONE) do |http|
          request = Net::HTTP::Get.new uri.request_uri
            request.basic_auth 'encorelab', 'encorepw'

      response = http.request request # Net::HTTPResponse object

      render :json => response.body
      # puts response.body
    end




    # WORKING WITH INTERNAL SERVER 
    # response = Net::HTTP.get_response($uri)
    # data = response.body
    # JSON.parse(data)

    # test = @current_user.username
    # if(test.eql?"test456")
    #     render :json =>@current_user.first_name
    # else
    #     render :json => data
    # end
    # BLOCK WORKING FOR TESTINGGGGG

  end
  def pushdata
  	render file: Rails.root.join("public", "d3.html"),
             layout: 'application'
  end

  def displaydata
  	response1 = Net::HTTP.get_response(URI.parse($androidtest))
    data1 = response1.body
    JSON.parse(data1)

    render :text => JSON.parse(data1)
    # render :inline => "<% items.each do |p| %><p><%= p.name %><p><% end %>"
	end

  def homepage
  end

  def stream
    redirect_to user_session_path
  end


end
