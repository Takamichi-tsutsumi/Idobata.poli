class Admin::TopController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
end
