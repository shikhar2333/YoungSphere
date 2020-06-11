class UploadController < ApplicationController
  # before_action :user_params
  include UploadHelper
  def default
  end
  def host
    current_user.static_website.attach(params[:static_website])
    puts "Status:" + current_user.static_website.attached?.to_s
    # puts "Path of website:" + ActiveStorage::Blob.service.path_for(current_user.static_website.key).to_s
    if current_user.static_website.attached?
        Dir.mktmpdir do |dir|
          website_attachment_path = "#{dir}/#{current_user.static_website.filename}"
          File.open(website_attachment_path, 'wb') do |file|
            file.write(current_user.static_website.download)
          end 
          unzip_file(website_attachment_path, dir)
          File.delete(website_attachment_path) if File.exist?(website_attachment_path)
          puts "Dir:" + dir.to_s
          return_new_bucket(dir, current_user.static_website.filename)
          puts "My new website: #{website_attachment_path}"
        end
    end
  end

  private

  
end
