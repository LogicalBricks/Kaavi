# put logic in this file or initalizer/carrierwave.rb
if defined?(CarrierWave)
  CarrierWave::Uploader::Base.descendants.each do |klass|
    next if klass.anonymous?
    klass.class_eval do
      def cache_dir
        "#{Rails.root}/spec/tmp/uploads/tmp"
      end
               
      def store_dir
        "#{Rails.root}/spec/tmp/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
      end
    end
  end
end