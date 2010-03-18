module ModelMaker
  class Model
    class Attribute
      attr_accessor :name, :type, :options 
    
      def initialize(name, type, options = {})
        @name = name
        @type = type  
        self.options = {}
        options.each do |key, value|
          self.options[key] = value
        end          
      end

      def to_s
        s = " - #{name}, Type: #{type} " 
        s += options.inspect if !self.options.empty?        
        s + "\n"
      end
    
    end
  end
end