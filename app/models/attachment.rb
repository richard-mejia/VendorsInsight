class Attachment < ActiveRecord::Base
 do_not_validate_attachment_file_type :archivo
    config = Propiedad.first
 has_attached_file :archivo,
  :storage => :fog,
    :fog_credentials => {provider: 'Google', 
      google_access_key_id: 'GOOGJ2O7NUPJWG5OZ42Y', 
      google_secret_access_key: 'zy0mT/ju28VbZJycgfLs9toP6L95/zl0lqiuer7o'},
    :fog_directory => "imagenessolicitudes"
end
