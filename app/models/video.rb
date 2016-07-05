class Video < ActiveRecord::Base
	# has_attached_file :avatar, styles: { medium: "100x100>", thumb: "100x100>" } #default_url: "/images/:style/missing.png"
 #  validates_attachment_content_type :avatar, content_type: /\Avideo\/.*\Z/
	has_attached_file :avatar, styles: {
        :medium => {
          :geometry => "640x480",
          :format => 'mp4'
        },
        :thumb => { :geometry => "160x120", :format => 'jpeg', :time => 10}
    }, :processors => [:transcoder]
    validates_attachment_content_type :avatar, content_type: /\Avideo\/.*\Z/
end




