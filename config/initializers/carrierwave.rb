if Rails.env.test? || Rails.env.cucumber?
  CarrierWave.configure do |config|
    config.storage = :file
    config.enable_processing = false
  end

  # change my storage to file when test
  ImageUploader.storage = :file

  # use different dirs when testing
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/public/uploads/tmp"
      end

      def store_dir
        "#{Rails.root}/public/uploads/tmp/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end
