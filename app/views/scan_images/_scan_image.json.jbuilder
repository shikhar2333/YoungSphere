json.extract! scan_image, :id, :label, :created_at, :updated_at
json.url scan_image_url(scan_image, format: :json)
