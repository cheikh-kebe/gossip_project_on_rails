class ApplicationController < ActionController::Base
  include SessionsHelper
  include GossipHelper 
  include UserHelper
end
