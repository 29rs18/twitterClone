class Api::V1::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource = nil, _opts = {})
    if resource.present?
      puts "Resource: #{resource.inspect}" # Debugging output
      render json: resource
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    head :no_content
  end
end
