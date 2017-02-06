require 'bamboo_hr'

RSpec.describe BambooHR do
  it "it can get employees from bamboo hr" do
    bamboo_hr = BambooHR.new("8thlight")
    expect(bamboo_hr.employees).to be_a(Array)
    expect(bamboo_hr.employees.first["id"]).to eq("90")
  end
end
