module ApplicationHelper

	def gravatar_for(record, options = { size: 80})
	    email_address = record.email.downcase
	    hash = Digest::MD5.hexdigest(email_address)
	    size = options[:size]
	    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
	    image_tag(gravatar_url, alt: record.full_name, class: "rounded shadow mt-4 mx-auto d-block")
	end

end
