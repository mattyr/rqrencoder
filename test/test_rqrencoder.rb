require 'test/unit'
require 'rqrencoder'

class TestRQREncoder < Test::Unit::TestCase

  def test_block_form
    encoder = RQREncoder::QREncoder.create do |enc|
      enc.level = 2
    end
    assert_equal(2, encoder.options[:level])
  end

  def test_encoding
    encoder = RQREncoder::QREncoder.new
    result = encoder.encode("FOO BAR")
    assert_equal(1, result.level)
    assert_equal(1, result.version)
    assert_equal(0, result.masking)
    assert_equal(21, result.size)
    assert_equal(21, result.modules.length)
    assert_equal(21, result.modules[0].length)
  end

end
