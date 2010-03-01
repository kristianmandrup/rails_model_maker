module ModelMaker
  class Executor
    attr_reader :parser
    
    def initialize
      @parser = Parser.new
    end
           
    def run(file, options)
      # load yml file   
      yml = YAML.load_file(filename)
      yml.each do |key, value|
        # run appropriate generators for parsed model
        run_generators model if model = get_model(key, value)             
      end      
    end

    def get_model(key, value)
      parser.parse value if key == 'MODEL'      
    end
  end
end


mme = ModelMaker::Executor.new
mme.run 'blog_model.yml', :generator => {:name => 'rspec:scaffold', :options => '--transaction false'}, :orm => :mongo_mapper
