module ApplicationHelper

  def resource_name
    :user
  end
  
  def resource
    @resource ||= User.new
  end
  
  def resource_class
    User
  end
  
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def render_2xx(message, status, data = {})
    render json: { message: message, status: status }.merge(data)
  end

  def render_4xx(message, status, data = {})
    render json: { message: message, status: status }.merge(data)
  end
end
