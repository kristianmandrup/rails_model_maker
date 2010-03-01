module ModelMaker
  class Meta
    attr_accessor :inherits, :namespace
    
    def initialize(options)
      options.each do |key, value|
        self.send(key, value) if self.respond_to? key
      end          
    end
    
  end
end