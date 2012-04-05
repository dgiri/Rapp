class Photo < ActiveRecord::Base
  belongs_to :album
  has_attached_file :image,
      :styles => {
        :thumb=> "117x100#",
        :small  => "260x180>",
        :large => "800x500>"
          }
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']   
end
