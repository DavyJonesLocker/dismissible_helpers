class User < ActiveRecord::Base
  attr_accessible :dismissed_helpers, :email

  include EasyAuth::Models::Account

  serialize :dismissed_helpers, Array
end
