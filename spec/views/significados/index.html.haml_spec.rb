require 'spec_helper'

describe "significados/index" do
  before(:each) do
    assign(:significados, [
      stub_model(Significado),
      stub_model(Significado)
    ])
  end

  it "renders a list of significados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
