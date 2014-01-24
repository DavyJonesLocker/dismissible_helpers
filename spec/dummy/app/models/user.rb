class User < ActiveRecord::Base
  include EasyAuth::Models::Account

  serialize :dismissed_helpers, Array
end
