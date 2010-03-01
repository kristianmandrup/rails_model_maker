module ModelMaker
  class Model
    attr_accessor :attributes, :associations, :meta
    
    def initialize(attributes = nil, associations = nil, meta = nil)
      @attributes ||= [] 
      attributes.each do |att|
        @attributes << Attribute.new att
      end

      @associations ||= []
      associations.each do |att|
        @associations << Association.new att
      end
      
      meta ? @meta ||= Meta.new meta : nil           
    end
    
  end
end