class ApplicationController < ActionController::Base
  before_filter :set_charset
  def set_charset
      headers["Content-Type"] ||= "text/html; charset=utf-8" 
  end 
end
