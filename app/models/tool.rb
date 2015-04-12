class Tool < ActiveRecord::Base
	belongs_to :user

	has_attached_file :tool_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	do_not_validate_attachment_file_type :tool_image
end
