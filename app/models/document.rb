class Document < ApplicationRecord
  belongs_to :user ,optional:  true

  has_attached_file :document_attached,
                    styles: lambda { |a| a.instance.check_file_type},
                  default_url: "/images/:style/missing.png",
                    :url =>"/image/:class/:id/:style/:basename.:extension",
               :path => ":rails_root/public/image/:class/:id/:style/:basename.:extension"


  VALID_IMAGE_TYPES = ['application/pdf','image/gif', 'image/png', 'image/jpeg', 'image/jpg', 'video/avi',
                       'video/mov',
                       'video/mp4',
                       'video/x-flv',
                       'video/3gpp',
                       'video/quicktime',
                       'video/x-msvideo',
                       'video/x-ms-wmv',
                       'flv-application/octet-stream',
                       'application/octet-stream',
                       'video/x-flv',
                       'video/mpeg',
                       'video/mpeg4',
                       'video/x-la-asf',
                       'video/x-ms-asf',
                       'application/msword',
                       'application/vnd.openxmlformats-officedocument.wordprocessingml.document']



  validates_attachment :document_attached,content_type:{content_type: VALID_IMAGE_TYPES,:message=>"file can be of jpg,jpeg,gif,pdf"}
  validates_attachment_size :document_attached,:less_than=>125.megabytes,:message=>"Size cant be greater then 125"


  def check_file_type
    if is_image_type?
      {:small => "x200>", :medium => "x300>", :large => "x400>"}
    elsif is_video_type?
      {
          :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10, :processors => [:ffmpeg] },
          :medium => {:geometry => "250x150#", :format => 'jpg', :time => 10, :processors => [:ffmpeg]}
      }
    elsif is_pdf?
      {
          :thumb => ["200x200>", :png],
          :medium => ["500x500>", :png]
      }
    end
  end

  def is_image_type?
    document_attached_content_type =~ %r(image)
  end

  def is_video_type?
    document_attached_content_type =~ %r(video)
  end

  def is_pdf?
    document_attached_content_type =~ %r(pdf)
  end

#   def video?
#     [ 'application/x-mp4',
#       'video/mpeg',
#       'video/quicktime',
#       'video/x-la-asf',
#       'video/x-ms-asf',
#       'video/x-msvideo',
#       'video/x-sgi-movie',
#       'video/x-flv',
#       'flv-application/octet-stream',
#       'video/3gpp',
#       'video/3gpp2',
#       'video/3gpp-tt',
#       'video/BMPEG',
#       'video/BT656',
#       'video/CelB',
#       'video/DV',
#       'video/H261',
#       'video/H263',
#       'video/H263-1998',
#       'video/H263-2000',
#       'video/H264',
#       'video/JPEG',
#       'video/MJ2',
#       'video/MP1S',
#       'video/MP2P',
#       'video/MP2T',
#       'video/mp4',
#       'video/MP4V-ES',
#       'video/MPV',
#       'video/mpeg4',
#       'video/mpeg4-generic',
#       'video/nv',
#       'video/parityfec',
#       'video/pointer',
#       'video/raw',
#       'video/rtx' ]
# end

  end
