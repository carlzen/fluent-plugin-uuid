require 'uuidtools'

class Fluent::UUIDOutput < Fluent::Output

  Fluent::Plugin.register_output('uuid', self)

  config_param :uuid_key_name,  :string,  :default => 'uuid'
  config_param :add_tag_prefix, :string, :default => 'uuid'

  def initialize
    super
  end

  def configure(conf)
    super
    @tag_prefix = "#{@add_tag_prefix}."
    @add_hash = Hash.new

    @tag_proc =
      if @tag_prefix
        Proc.new {|tag| "#{@tag_prefix}#{tag}" }
      else
        Proc.new {|tag| tag }
      end

  end

  def emit(tag, es, chain)
    emit_tag = @tag_proc.call(tag)

    es.each do |time,record|
      @add_hash.each do |k,v|
        record[k] = v
      end
      record[@uuid_key_name] = UUIDTools::UUID.timestamp_create

      Fluent::Engine.emit(emit_tag, time, record)
    end

    chain.next
  end
end
