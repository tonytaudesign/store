class ErrorsController < ApplicationController

	skip_before_filter :authorization

  def routing
  	render_404
  end
end
