module RQREncoder
  class QRCode
  	
    def initialize(content, level, version, size, modules)
			@content = content
      @level = level
      @version = version
      @size = size
      @modules = modules
    end

		def content
			@content
		end

    def level
      @level
    end
    
    def version 
      @version
    end
    
    def size
      @size
    end

    def modules
      @modules
    end 

  end
end


