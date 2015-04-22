class MainController < ApplicationController

  def index
   render text: "Hello, World!", content_type: "text"
  end

  def reflect
    request_headers = request.headers.select{|k,v| k =~ /^HTTP_/}
    request_headers = request_headers.map{|k,v| "#{k}: #{v}"}.join("\n")
    render text: "#{request_headers}\n", content_type: "text"
  end

  def redirect
    redirect_to "https://raw.githubusercontent.com/booch/presentations/master/HTTP_Exploration/app/app/controllers/main_controller.rb"
  end

  protect_from_forgery :except => :post

  def post
    post_params = params.reject{|k,v| %w[controller action].include?(k)}
    post_params = post_params.map{|k,v| "#{k}: #{v}"}.join("\n")
    render text: "#{post_params}\n", content_type: "text"
  end

end
