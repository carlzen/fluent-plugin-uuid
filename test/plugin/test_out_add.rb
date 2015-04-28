require 'helper'

class AddOutputTest < Test::Unit::TestCase
  def setup
    Fluent::Test.setup
  end

  CONFIG = %[
    add_tag_prefix this_is_my_test_prefix
  ]
  
  def create_driver(conf = CONFIG, tag='test')
    Fluent::Test::OutputTestDriver.new(Fluent::AddOutput, tag).configure(conf)
  end

  def test_configure 
    d = create_driver
    assert_equal 'this_is_my_test_prefix', d.instance.config["add_tag_prefix"] 
  end

  def test_format
    d = create_driver
    
    time = Time.parse("2015-01-01 11:11:11 UTC").to_i
    d.run do
      d.emit("a" => 1)
    end
    mapped = {'a' => 'b', 'c' => 'd'}
    assert_equal [
      {"a" => 1}.merge(mapped),
    ], d.records

    d.run
  end
end
