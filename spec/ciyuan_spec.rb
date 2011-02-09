require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Ciyuan" do
  it "should return the etymology of the chracter i provide" do
    # $KCODE = 'UTF8'
    chinese = [35299].pack("U*") # 解
    Ciyuan.search(chinese).etymology.should match /.*break up.*/
  end
end
