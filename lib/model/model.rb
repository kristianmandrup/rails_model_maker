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

    def set(arg)
      case arg
      when Attribute
        attributes << arg
      when Association
        associations << arg
      when Meta
        meta = arg
      end
    end      

    def to_s
      "Attributes: " + attributes.each{|a| "#{a}"} + "\n" + 
      "Associations: " + associations.each{|a| "#{a}"} + "\n" +      
      "Meta: #{meta}"            
    end
    
  end
end