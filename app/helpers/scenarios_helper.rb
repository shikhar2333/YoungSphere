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
    def return_new_bucket (dir, bucket, scenario)
        bucket = "youngsphere-#{current_user.name}-#{scenario.id}"
        profile_name = 'JinMoRi'
        puts "Bucket" + bucket.to_s
        s3 = Aws::S3::Client.new(profile: profile_name, region: ENV['AWS_REGION'])
        s3.create_bucket(bucket: bucket)
        uploader = S3Uploader::Uploader.new({
            :s3_key => ENV['AWS_ACCESS_KEY'],
            :s3_secret => ENV['AWS_SECRET_KEY'],
            :destination_dir => 'app',
            :region => ENV['AWS_REGION'],
            :threads => 10
           })
        uploader.upload(dir, bucket)
        bucket_contents = s3.list_objects(bucket: bucket).contents
        aws_folder = "app"
        acl = 'public-read'
        files = bucket_contents.map{ |f| "#{f.key}" if f.key.include?(aws_folder) }.compact
        files.each do |obj_key|
            s3.put_object_acl(
              key: obj_key,          # object(file) name
              bucket: bucket,
              acl: acl               # 'public-read'
            )
        end
    end
end
