$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'rspec'
require 'ciyuan'
require 'fakeweb'

# Requires supporting files with custom matchers and macros, etc,
# in ./support/ and its subdirectories.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  
end
FakeWeb.allow_net_connect = false

# http://www.internationalscientific.org/CharacterEtymology.aspx?characterInput=Ëß£
FakeWeb.register_uri(:get, "http://www.internationalscientific.org/CharacterEtymology.aspx?characterInput=%E8%A7%A3", :status => 201, :body => File.read(File.join(File.dirname(__FILE__), "etymology.html")))