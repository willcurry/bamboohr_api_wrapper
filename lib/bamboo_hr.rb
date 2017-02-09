require 'httparty'

class BambooHR
  include HTTParty

  base_uri "https://api.bamboohr.com"

  def initialize(subdomain)
    @subdomain = subdomain
    @api_key = ENV["BAMBOO_HR_API_KEY"]
    if @api_key.nil?
      raise "Invalid API key! Have you set one?"
    end
  end

  def employees
    data = JSON.parse(employees_data.body)
    data["employees"]
  end

  def employee(id)
    JSON.parse(employee_data(id).body)
  end

  def time_off_requests
    JSON.parse(time_off_data.body)
  end

  def whos_out
    JSON.parse(whos_out_data.body)
  end

  def benefit_coverage
    JSON.parse(benefit_coverage_data.body)
  end

  def benefit_groups
    JSON.parse(benefit_groups_data.body)
  end

  private

  def employees_data
    self.class.get("/api/gateway.php/#{@subdomain}/v1/employees/directory", basic_auth: auth_info, headers: headers)
  end

  def benefit_groups_data
    self.class.get("/api/gateway.php/#{@subdomain}/v1/benefitgroups", basic_auth: auth_info, headers: headers)
  end

  def benefit_coverage_data
    self.class.get("/api/gateway.php/#{@subdomain}/v1/benefitcoverages", basic_auth: auth_info, headers: headers)
  end

  def employee_data(id)
    self.class.get("/api/gateway.php/#{@subdomain}/v1/employees/#{id}", basic_auth: auth_info, headers: headers)
  end

  def time_off_data
    self.class.get("/api/gateway.php/#{@subdomain}/v1/time_off/requests", basic_auth: auth_info, headers: headers)
  end

  def whos_out_data
    self.class.get("/api/gateway.php/#{@subdomain}/v1/time_off/whos_out", basic_auth: auth_info, headers: headers)
  end

  def headers
    {'Accept' => 'application/json'}
  end

  def auth_info
    {username: @api_key, password: "x"}
  end
end
