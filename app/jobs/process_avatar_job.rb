class ProcessAvatarJob < ActiveJob::Base
  include ::CarrierWave::Workers::ProcessAssetMixin
end
