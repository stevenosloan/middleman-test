require 'spec_helper'

describe Middleman::Test::VERSION do
  it "has a version" do
    expect( Middleman::Test::VERSION >= '0.0.0' ).to eq true
  end
end
