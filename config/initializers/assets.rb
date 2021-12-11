Rails.application.config.assets.precompile << 'startup_wizard_manifest.js'

Rails.application.config.assets.configure do |env|
  env.export_concurrent = false
end
