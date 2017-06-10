module BlogsHelper
  def choose_new_or_edit
    Rails.logger.info "choose_new_or_edit in"
    Rails.logger.info "controller name is " + controller_name
    Rails.logger.info "action name is " + action_name
    if action_name == 'new' || action_name == 'confirm'
      confirm_blogs_path
    elsif action_name == 'edit'
      blog_path
    end
  end
end
