class FoliosController < ApplicationController
  def index
    @folio = Folio.all
  end

  def show
    @folio = Folio.find(params[:id])
  end

  def create
  	
  end
end
