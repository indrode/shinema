require 'spec_helper'

describe "movie_lists/index" do
  before(:each) do
    assign(:movie_lists, [
      stub_model(MovieList,
        :title => "Title"
      ),
      stub_model(MovieList,
        :title => "Title"
      )
    ])
  end

  it "renders a list of movie_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
