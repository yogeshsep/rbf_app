require 'spec_helper'

describe "Index page" do

  it "should have the content 'Ruby Benefit Fund'" do
    visit '/customers/index'
    page.should have_content('Ruby Benefit Fund')
  end
end