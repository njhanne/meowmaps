module UsersHelper

	def gravatar_for(user, options = { size: 80 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  	size = options[:size]
  	gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=http%3A%2F%2F2.s3.envato.com%2Ffiles%2F23476441%2Fkitik.jpg"
  	image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end
end