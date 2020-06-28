require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.staging? || Rails.env.development?
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.secrets.aws_access_key_id,
      aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
      # persistent: false,
      region: Rails.application.secrets.s3_region
    }
    config.fog_directory = Rails.application.secrets.s3_bucket
    config.storage = :fog
    config.remove_previously_stored_files_after_update = true
    config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
  else
    config.storage = :file
    config.asset_host = ActionController::Base.asset_host
  end

  if Rails.env.test?
    config.enable_processing = false
  end
end
