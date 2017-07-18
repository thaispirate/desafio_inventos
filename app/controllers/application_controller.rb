class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :json
  def hello
    render html: "hello, world!"
  end
end
