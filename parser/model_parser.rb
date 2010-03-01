module ModelMaker
  class Parser
    def parse_model(obj, &blk)
      case obj
      when Hash
        handle_hash(obj, &blk)
      when Array
        handle_list(obj, &blk)
      else
        handle_single(obj, &blk)
      end
      
    end
    
  protected
    def handle_hash(obj, &blk)
      # Forget keys because I don't know what to do with them
      obj.each do |key, value|
      end
    end

    def handle_list(obj, &blk)
      obj.each do |value| 

      end
    end

    def handle_single(obj, &blk)
      if obj
      end
    end    
    
  end
end
          