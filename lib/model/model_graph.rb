module ModelMaker
  class ModelGraph
    attr_accessor :models
    
    def initialize()
      @models ||= {} 
    end

    def << (model)
      models[model.name] = model
    end      

    def [] (name)
      models[name]
    end      

    def to_s
      "Models: " + models.each_pair{|key, value| "#{value}"}
    end
    
  end
end