require 'spec_helper'

describe 'CRUD GET index' do
  before do
    Page.destroy_all
    @f1 = Page.new(:title => "Title 01", :content=>"Content 01")
    @f2 = Page.new(:title => "Title 02", :content=>"Content 02")
  end
  it 'returns a JSON index' do
    get api_pages_path
    response.body.should == [@f1, @f2].map{|f| f.to_json(:only => [:title, :content])}.to_json
  end
end
