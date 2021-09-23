class ReportsController < ApplicationController
  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show
  end

  def new
  end

  def edit
  end
end
