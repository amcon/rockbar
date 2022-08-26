$ ->

  if $('#photo_widget_opener').length
    cloudinary.applyUploadWidget document.getElementById('photo_widget_opener'), {
      cloudName: 'rockbar'
      uploadPreset: 'PRESET'
      fieldName: 'photo[photo_image_id]'
      sources: [ 'local', 'camera']
      thumbnailTransformation: [{width: 300, height: 300, crop: 'lfill'}]
      secure: true
      multiple: false
    }, (error, result) ->
      console.log error, result
      return

  if $('#album_widget_opener').length
    cloudinary.applyUploadWidget document.getElementById('album_widget_opener'), {
      cloudName: 'rockbar'
      uploadPreset: 'PRESET'
      fieldName: 'photo_album[album_image_id]'
      sources: [ 'local', 'camera']
      cropping: 'server'
      croppingAspectRatio: 1.5
      croppingShowDimensions: true
      croppingCoordinatesMode: 'custom'
      eager: 'custom'
      secure: true
      multiple: false
    }, (error, result) ->
      console.log error, result
      return

  if $('#event_widget_opener').length
    cloudinary.applyUploadWidget document.getElementById('event_widget_opener'), {
      cloudName: 'rockbar'
      uploadPreset: 'PRESET'
      fieldName: 'event[profile_image_id]'
      sources: ['local', 'camera']
      cropping: 'server'
      croppingAspectRatio: 0.67
      croppingShowDimensions: true
      croppingCoordinatesMode: 'custom'
      eager: 'custom'
      secure: true
      multiple: false
    }, (error, result) ->
      console.log error, result
      return

  if $('#staff_widget_opener').length
    cloudinary.applyUploadWidget document.getElementById('staff_widget_opener'), {
      cloudName: 'rockbar'
      uploadPreset: 'PRESET'
      fieldName: 'staff[staff_image_id]'
      sources: ['local', 'camera']
      cropping: 'server'
      croppingAspectRatio: 1
      croppingShowDimensions: true
      croppingCoordinatesMode: 'custom'
      eager: 'custom'
      secure: true
      multiple: false
    }, (error, result) ->
      console.log error, result
      return


