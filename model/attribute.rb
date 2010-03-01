module ModelMaker
  class Model
    class Attribute
      attr_accessor :name, :type, :index, :required 
    
      def initialize(name, type, options = {})
        @name = name
        @type = type
        options.each do |key, value|
          self.send(key, value) if self.respond_to? key
        end          
      end
    
    end
  end
end