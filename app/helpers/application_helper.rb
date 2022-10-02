module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    email = user.email.downcase
    hash = Digest::MD5.hexdigest(email)
    size = options[:size]
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(image_src, alt: user.username)
  end

end
