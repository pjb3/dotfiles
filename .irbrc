require 'irb/completion'

# History
#require 'irb/ext/save-history'  #wirble does history
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:SAVE_HISTORY] = 100
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"
IRB.conf[:AUTO_INDENT] = true

# Wirble is a plugin to colorize your irb, it's installed from a gem (gem install -y wirble)
require 'rubygems'
begin
  # load wirble
  require 'wirble'

  # start wirble (with color)
  Wirble.init
  Wirble.colorize
rescue LoadError => err
  warn "Couldn't load Wirble: #{err}"
end

# use HIRB if available
begin
  require 'hirb'
  Hirb::View.enable
rescue LoadError => err
  warn "No Hirb: #{err}"
end

# Log ActiveRecord to STDOUT if in Rails
if ENV.include?('RAILS_ENV')
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end
elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger && Rails.respond_to?(:logger=)
    Rails.logger = Logger.new(STDOUT)
  end
elsif defined?(ActiveRecord)
  ActiveRecord::Base.logger = Rails.logger
end
