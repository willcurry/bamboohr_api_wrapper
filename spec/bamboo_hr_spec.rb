require 'bamboo_hr'

RSpec.describe BambooHR do
  it "can get employees from bamboo hr" do
    bamboo_hr = BambooHR.new("8thlight")
    expect(bamboo_hr.employees).to be_a(Array)
    expect(bamboo_hr.employees.first["id"]).to eq("90")
  end

  it "can get time off requests from bamboo hr" do
    bamboo_hr = BambooHR.new("8thlight")
    expect(bamboo_hr.time_off_requests).to be_a(Array)
    expect(bamboo_hr.time_off_requests.first["type"]["id"]).to eq("1")
  end
end
