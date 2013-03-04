require 'guard'
require 'guard/guard'
require 'guard/watcher'
require 'hipchat'

module Guard
  # Send notifications to Hipchat
  class Hipchatter < Guard

    CONFIG = {
      :api => nil,
      :room => nil,
      :user => 'Guard',
      :notify => false,
      :color => 'green'
    }

    def initialize(watchers = [], options = {})
      super
      @options = CONFIG.merge(options)
    end

    def run_on_changes(paths)
      send_notification("#{paths.first} was updated at #{Time.now}.")
    end

  private
    def send_notification(msg, color = options[:color])
      check_options
      client[options[:room]].send(options[:user], msg, :color => color, :notify => options[:notify])
      UI.info "Hipchat: message sent"

      rescue HipChat::Unauthorized => error
        UI.error "Hipchat: Access denied! Check permissions and API token"
      rescue HipChat::UnknownRoom => error
        UI.error "Hipchat: Unknown room '#{options[:room]}'"
    end

    def check_options
      return UI.error "No API Key given. Plz fix." unless @options[:api]
      return UI.error "No Room given. Plz fix." unless @options[:room]
    end

    def client
      @client ||= HipChat::Client.new(options[:api])
    end
  end
end