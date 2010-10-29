module RQREncoder
  class QRCode
  	
    def initialize(level, version, masking, size, modules)
      @level = level
      @version = version
      @masking = masking
      @size = size
      @modules = modules
    end

    def level
      @level
    end
    
    def version 
      @version
    end
    
    def masking
      @masking
    end

    def size
      @size
    end

    def modules
      @modules
    end 

  end
end


