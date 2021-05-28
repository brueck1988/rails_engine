# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_bad_request
  rescue_from ActiveRecord::StatementInvalid, with: :statement_invalid

  private

  def record_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def record_bad_request(exception)
    render json: { error: exception.record.errors }, status: :bad_request
  end
  
  def statement_invalid
    render json: {error: "error"}, status: 400
  end
end
