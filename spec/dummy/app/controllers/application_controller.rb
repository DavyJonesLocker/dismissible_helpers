class ApplicationController < ActionController::Base
  include EasyAuthHelper
  protect_from_forgery
end
