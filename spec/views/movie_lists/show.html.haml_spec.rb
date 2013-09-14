require 'spec_helper'

describe "movie_lists/show" do
  before(:each) do
    @movie_list = assign(:movie_list, stub_model(MovieList,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
