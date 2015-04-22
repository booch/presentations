class HelloController < ApplicationController

  def index
   render text: "Hello, World!", content_type: "text"
  end

  def reflect
    request_headers = request.headers.map{|k,v| "#{k}: #{v}"}.join("\n")
    render text: "<h1>Hello, World!</h1><pre><code>#{request_headers}</code></pre>\n".html_safe
  end

  def redirect
    redirect_to "https://www.google.com/"
  end

  def post

  end

end
