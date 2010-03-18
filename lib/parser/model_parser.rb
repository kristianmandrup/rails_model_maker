module ModelMaker
  class Parser 
    
    def parse_model(obj, &blk)
      model = Model.new      
      case obj
      when Hash
        handle_model(obj, model, &blk)        
      else
        raise "Models must be modeled as a YAML hash"
      end      
      model
    end
    
  protected
    def handle_model(obj, model, &blk)
      # Forget keys because I don't know what to do with them
      obj.each do |key, value|
        case 
        when Array
          handle_model_items(obj, model, &blk)
        else
          raise "Model data be modeled as a list"        
      end
    end

    def handle_hash(obj, model, &blk)
      # Forget keys because I don't know what to do with them
      obj.each do |key, value|
        model.set parse_value(key, value)
      end
    end

    def handle_model_items(obj, model, &blk)
      obj.each do |value| 
        case obj
        when Hash
          handle_hash(obj, model, &blk)
        else
          handle_single(obj, model, &blk)          
        end        
      end
    end

    def handle_single(obj, model, &blk)
      model.set parse_value(obj)
    end    

    def parse_value(key, value = nil)
      parse_meta(key, value) if key = key.gsub(/^_/, '')
      attribute(key, value) 
    end 

    def parse_meta(key, value = nil)
      Meta.new key, value
    end

    def attribute(key, value)
      Attribute.new key, type(value), options(value)
    end                       
    
    def type(type)
      type = type.gsub(/\(.*$/, '') ? type : string
    end

    def options(opt)  
      opt = opt[/\((.*)\)/, 1]
      options = opt.split(':')
      options.inject({}){|res, opt| res[opt.to_sym => true]}      
    end
    
  end
end
          