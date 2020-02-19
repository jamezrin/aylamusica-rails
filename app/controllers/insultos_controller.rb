class InsultosController < ApplicationController
  def new

  end

  def create
    render plain: params[:insulto].inspect
  end
end
