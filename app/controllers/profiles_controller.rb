class ProfileController < ApplicationController

  before_action :authorize, only: [:index]

  def index
  end

end
