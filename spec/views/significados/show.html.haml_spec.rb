require 'spec_helper'

describe "significados/show" do
  before(:each) do
    @significado = assign(:significado, stub_model(Significado))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
