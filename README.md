#BambooHR API Wrapper

#Setup

Set this enviroment variable to your API key from BambooHR.

``` bash
export BAMBOO_HR_API_KEY="XXXXX"
```

#Usage

``` bash
bamboo_hr = BambooHR.new("subdomain")
bamboo_hr.employees => {"id" => 1, "displayName" => "Will Curry", "firstName" => "Will", "lastName" => "Curry", "preferredName" => "Will", "jobTitle" => "Developer"}
bamboo_hr.time_off_requests => {"id" => "1", "employeeId" => "1", status => {"lastChanged" => "2017-02-07", "lastChangedByUserId" => "1", "status" => "approved"}}
//The hashes returned contain more fields which can be found on the bamboo hr api documentation.
```

