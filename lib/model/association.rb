module ModelMaker
  class Model
    class Association
      attr_accessor :has_one_list, :has_many_list, :belongs_to_list
    
      def initialize(obj, type)        
        one_rel(obj) if type.contains? 'one'
        many_rel(obj) if type.contains? 'many'          
        belong_rel(obj) if type.contains? 'belonging'            
      end

      def one_rel(obj, option)
        has_one_list << obj
      end

      def many_rel(obj, option)
        has_many_list << obj
      end

      def belong_rel(obj)
        model[obj].belongs_to(obj)
      end


      def to_s
        s = " - #{name}, Type: #{type} " 
        s += options.inspect if !self.options.empty?        
        s + "\n"
      end

    
    end
  end
end