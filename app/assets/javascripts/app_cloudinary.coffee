$ ->

  $('#photo_widget_opener').cloudinary_upload_widget {
    cloud_name: 'rockbar',
    upload_preset: 'PRESET',
    field_name: 'photo[photo_image_id]',
    sources: ['local', 'camera'],
    thumbnail_transformation: [
        { width: 300, height: 300, crop: 'lfill'}
      ],
    multiple: false
  }, (error, result) ->
    console.log error, result
    return  

  $('#album_widget_opener').cloudinary_upload_widget {
    cloud_name: 'rockbar',
    upload_preset: 'PRESET',
    field_name: 'photo_album[album_image_id]',
    sources: ['local', 'camera'],
    cropping: 'server',
    cropping_aspect_ratio: 1.5,
    cropping_show_dimensions: true,
    cropping_coordinates_mode: 'custom',
    cropping_validate_dimensions: true,
    eager: 'custom',
    multiple: false
  }, (error, result) ->
    console.log error, result
    return 

  $('#event_widget_opener').cloudinary_upload_widget {
    cloud_name: 'rockbar',
    upload_preset: 'PRESET',
    field_name: 'event[profile_image_id]',
    sources: ['local', 'camera'],
    cropping: 'server',
    cropping_aspect_ratio: .67,
    cropping_show_dimensions: true,
    cropping_coordinates_mode: 'custom',
    cropping_validate_dimensions: true,
    eager: 'custom',
    multiple: false
  }, (error, result) ->
    console.log error, result
    return      
