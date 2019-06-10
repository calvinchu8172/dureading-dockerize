Settings.environments.paperclip.attachment.default.each do |key, value|
  Paperclip::Attachment.default_options[key] = value
end