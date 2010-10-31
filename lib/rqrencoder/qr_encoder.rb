require 'rqrencoder/RQREncoder'

module RQREncoder
  class QREncoder
    # options
    #  :version 		will auto-extend if too low (default)
    #  :level       L:0, M:1(default), Q:2, H:3
    #  :mode				hint for mode NUM:0, A/N:1 (default), 8Bit: 2, KANJI: 3
    #  :case_sensitive true(default) / false
  	def initialize(options = {})
  		@options = { :level => 1, :version => 0, :mode => 2, :case_sensitive => true }
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
				key = sym[0..-2].to_sym
				super(sym, *args, &block) unless (@options.has_key? key)
        @options[key] = args[0]
      end
    end

    def encode(data)
			c_code_result = RQREncoder.QRcode_encodeString(data, @options[:version], @options[:level], @options[:mode], @options[:case_sensitive] ? 1 : 0) 
      QRCode.new(data, @options[:level], c_code_result.version, c_code_result.width, c_code_result.modules)
    end
	
  end
end
