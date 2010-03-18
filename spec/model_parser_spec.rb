describe ModelMaker::Parser do
  context "Model is nil" do
    let :model { nil }
    let :parser { ModelMaker::Parser.new }
    it "should raise an Exception" do
      lambda {parser.parse model }.should raise_error
    end
  end


  context "Model is empty" do
    let :model { ['MODEL'] }
    let :parser { ModelMaker::Parser.new }
    it "should raise an Exception" do
      lambda {parser.parse model }.should raise_error
    end
  end

  context "Model has single item" do
    let :model { ['a'] }
    let :parser {  }
    it "should raise an Exception" do
      lambda {parser.parse model }.should raise_error
    end
  end

  context "Model has a MODEL but no valid model structures" do
    let :model { {} }
    let :parser { [{'MODEL' => 'blip'] }
    it "should raise an Exception" do
      lambda {parser.parse model }.should raise_error
    end
  end

  context "Model has a valid MODEL" do
    let :model { {} }
    let :parser { [{'MODEL' => 'blip'] }
    it "should raise an Exception" do
      lambda {parser.parse model }.should raise_error
    end
  end


end  
  