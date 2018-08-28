module ApplicationHelper
    def cl_image_tag_or_not(instance_of_photo_uploader)
    if instance_of_photo_uploader.present?
      instance_of_photo_uploader.path
    else
      "default-avatar"
    end
  end
end
