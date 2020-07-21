require 'zip'
require 'aws-sdk-s3' 
require 'securerandom'  
module ScenariosHelper
    def unzip_file (file, destination)
        FileUtils.mkdir_p(destination)
        Zip::File.open(file) do |zip_file|
        zip_file.each do |f|
           f_path=File.join(destination, f.name)
           FileUtils.mkdir_p(File.dirname(f_path))
           zip_file.extract(f, f_path) unless File.exist?(f_path)
           end
        end
    end
    def get_bucket_name(scenario)
        return "youngsphere-#{current_user.name.to_s}-#{scenario.id}"
    end
    def return_new_bucket (dir, bucket, scenario)
        bucket = get_bucket_name(scenario)
        profile_name = 'JinMoRi'
        s3_link = ''
        s3 = Aws::S3::Client.new(profile: profile_name, region: ENV['AWS_REGION'])
        s3.create_bucket(bucket: bucket)
        uploader = S3Uploader::Uploader.new({
            :s3_key => ENV['AWS_ACCESS_KEY'],
            :s3_secret => ENV['AWS_SECRET_KEY'],
            :destination_dir => '',
            :region => ENV['AWS_REGION'],
            :threads => 10
           })
        uploader.upload(dir, bucket)
        bucket_contents = s3.list_objects(bucket: bucket).contents
        aws_folder = ""
        acl = 'public-read'
        files = bucket_contents.map{ |f| "#{f.key}" if f.key.include?(aws_folder) }.compact
        files.each do |obj_key|
            key = obj_key.to_s
            if key.include? "index.html"
                s31 = Aws::S3::Resource.new
                new_bucket = s31.bucket(bucket)
                s3_link = new_bucket.object(key).public_url
            end
            s3.put_object_acl(
              key: obj_key,          # object(file) name
              bucket: bucket,
              acl: acl               # 'public-read'
            )
        end
        return s3_link
    end
end
