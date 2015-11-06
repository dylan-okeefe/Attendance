module StudentsHelper
  def gravatar_for(user)
    if user_signed_in?
      gravatar_id = Digest::MD5::hexdigest(current_user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: current_user.first_name, class: "gravatar")
    elsif admin_signed_in?
      gravatar_id = Digest::MD5::hexdigest(current_admin.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: current_admin.first_name, class: "gravatar")
    end
  end
end
