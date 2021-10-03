# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_commentable
  before_action :set_render

  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_render
    @template = 'reports/show'
  end
end
