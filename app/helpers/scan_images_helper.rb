module ScanImagesHelper
    def upload_image_s3(scan_image)
        scan_image_name = scan_image.scanned_image.filename
        if scan_image.scanned_image.attached?
            Dir.mktmpdir do |dir|
                scan_image_attachment_path = "#{dir}/#{scan_image_name}"
                File.open(scan_image_attachment_path, 'wb') do |file|
                    file.write(scan_image.scanned_image.download)
                end 
                s3 = Aws::S3::Resource.new(region: ENV['AWS_REGION'])
                bucket = 'static1.zip-0aadcc3b-7d36-4971-9280-84d15b2a2341'
                obj = s3.bucket(bucket).object(scan_image_name.to_s)
                obj.upload_file(scan_image_attachment_path)
                File.delete(scan_image_attachment_path) if File.exist?(scan_image_attachment_path)
            end
        end
        return push_labels(scan_image_name, scan_image)
    end

    def push_labels(scan_image_name, scan_image)
        credentials = Aws::Credentials.new(
            ENV['AWS_ACCESS_KEY'],
            ENV['AWS_SECRET_KEY']
        )
        bucket = 'static1.zip-0aadcc3b-7d36-4971-9280-84d15b2a2341' # the bucket name without s3://
        photo  = scan_image_name.to_s
        client   = Aws::Rekognition::Client.new credentials: credentials
        attrs = {
        image: {
            s3_object: {
            bucket: bucket,
            name: photo
            },
        },
        #  max_labels: 10
        }
        response = client.detect_text attrs
        array = Array.new
        response.text_detections.each do |text|
            array.push(text.detected_text.to_s)
        end
        return array
    end
end
