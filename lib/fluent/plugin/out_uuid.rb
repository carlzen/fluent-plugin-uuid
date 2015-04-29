require 'securerandom'

class Fluent::AddOutput < Fluent::Output

  Fluent::Plugin.register_output('uuid', self)

  config_param :uuid_len,       :integer, :default => 32
  config_param :uuid_key_name,  :string,  :default => 'uuid'

  def initialize
    super
  end

  def configure(conf)
    super
    @add_hash = Hash.new
  end

  def emit(tag, es, chain)
    es.each do |time,record|
      @add_hash.each do |k,v|
        record[k] = v
      end
      @add_hash[@uuid_key_name] = SecureRandom.hex(@uuid_len)
      Fluent::Engine.emit(tag, time, record)
    end

    chain.next
  end
end
