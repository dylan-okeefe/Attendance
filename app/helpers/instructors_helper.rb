module InstructorsHelper
  
  def gravatar_for(admin)
    gravatar_id = Digest::MD5::hexdigest(current_admin.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: current_admin.first_name, class: "gravatar")
  end
end
