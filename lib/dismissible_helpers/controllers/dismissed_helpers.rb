module DismissibleHelpers::Controllers::DismissedHelpers
  def create
    if respond_to?(:current_user) && current_user && current_user.respond_to?(:dismissed_helpers)
      current_user.dismissed_helpers += [ params[:helper] ]
      current_user.save!
    else
      if cookies[:dismissed_helpers].present?
        dismissed_helpers = cookies[:dismissed_helpers].split '|'
        dismissed_helpers += [ current_helper ]
      else
        dismissed_helpers = [ current_helper ]
      end
      cookies[:dismissed_helpers] = dismissed_helpers.join '|'
    end

    render :json => {}, :status => :ok
  end

  def destroy
    Rails.logger.info "destroy '#{current_helper}'"
    if respond_to?(:current_user) && current_user && current_user.respond_to?(:dismissed_helpers)
      current_user.dismissed_helpers = current_user.dismissed_helpers.reject { |helper| helper == current_helper }
      current_user.save!
    else
      if cookies[:dismissed_helpers].present?
        dismissed_helpers = cookies[:dismissed_helpers].split '|'
        dismissed_helpers = dismissed_helpers - [ current_helper ]
      end
      dismissed_helpers ||= []
      cookies[:dismissed_helpers] = dismissed_helpers.join('|')
    end

    render :json => {}, :status => :ok
  end

  private
  def current_helper
    return params[:helper].to_s
  end
end
