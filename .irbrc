require 'irb/completion'

# History
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT] = true

# use HIRB if available
begin
  require 'hirb'
  Hirb::View.enable
rescue LoadError => err
  #warn "No Hirb: #{err}"
end

# Log Rails and/or ActiveRecord to STDOUT
if defined?(Rails) && Rails.respond_to?(:logger=)
  require 'logger'
  Rails.logger = Logger.new(STDOUT)
end

if defined?(ActiveRecord) && ActiveRecord::Base.respond_to?(:logger=)
  require 'logger'
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
