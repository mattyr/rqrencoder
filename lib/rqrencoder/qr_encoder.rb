require 'rqrencoder/CQREncoder'

module RQREncoder
  class QREncoder
        # options
    #  :level       L:0, M:1(default), Q:2, H:3
    #  :version     S:0(default), M:1, L:2
    #  :auto_extend  true(default)|false auto extent if over version size
    #  :masking     masking pattern 0-7, -1(default auto)
    #  :length      data length
    #  :module_size module pixel size
    #  :eps_preview true|false(default)
  	def initialize(options = {})
  		@options = { :level => 1, :version => 0, :auto_extend => true, :masking => -1 }
      @options.merge!(options)
  	end

    def options
      @options
    end

    def self.create(options = {})
      encoder = QREncoder.new(options)
      yield encoder if block_given?
      encoder
    end

    def method_missing(sym, *args, &block)
      if (sym[-1] == '=')
        @options[sym[0..-2].to_sym] = args[0]
      end
    end

    def encode(data)
      cencoder = CQREncoder::CQR_Encode.new
      unless cencoder.EncodeData(@options[:level], @options[:version], @options[:auto_extend], @options[:masking], data)
        raise Exception.new("qrcode encode error!")
      end
      result = QRCode.new(cencoder.m_nLevel, cencoder.m_nVersion, cencoder.m_nMaskingNo, cencoder.m_nSymbleSize, cencoder.results)
      cencoder = nil
      result
    end
	
  end
end
