module RQREncoder
  class QRCode
    # options
    #  :level       L:0, M:1(default), Q:2, H:3
    #  :version     S:0(default), M:1, L:2
    #  :auto_extend  true(default)|false auto extent if over version size
    #  :masking     masking pattern 0-7, -1(default auto)
    #  :length      data length
    #  :module_size module pixel size
    #  :eps_preview true|false(default)
  	def initialize(options = {})
  		@options = { :level => 1, :version => 0, :auto_extend => true, 
  		             :masking => -1, :eps_preview => false, :module_size => 4 }
      @options.merge!(options)
      @imager = nil
  	end
  	
  	def self.create(options = {})
  	  raise BlockNotFoundException.new("Block not found!") unless block_given?
  	  qrcode = RQREncoder::QRCode.new(options)
  	  yield qrcode
  	  qrcode.close
	  end
  
    def get_modules(data)
      init_encoder(data)
      result = @encoder.results
      close
      result
    end
	
  	def close()
  	  @encoder = nil if @encoder
  	end
	
  private
  	def init_encoder(data)
      @encoder = CQREncoder::CQR_Encode.new
      unless @encoder.EncodeData(@options[:level], @options[:version], @options[:auto_extend], @options[:masking], data)
        close; raise Exception.new("qrcode encord error!")
      end
	  end
  end
end


