require 'spec_helper'

describe "palabras/index" do
  before(:each) do
    assign(:palabras, [
      stub_model(Palabra),
      stub_model(Palabra)
    ])
  end

  it "renders a list of palabras" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
