require "spec_helper"

module PeopleHR
  describe Employees do
    let(:stubs) { Faraday::Adapter::Test::Stubs.new }
    let(:test) do
      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    end

    let(:api_key) { "abc123abc123abc123" }

    let(:api) { API.new(api_key: api_key, connection: test) }

    let(:employees) { Employees.new(api: api) }

    describe "#all" do
      it "lists all employees" do
        stubs.post("/") do |env|
          [
            200,
            {},
            EMPLOYEE_DATA
          ]
        end
        expect(employees.all.length).to eq(2)
      end

      it "returns Employee objects" do
        stubs.post("/") do |env|
          [
            200,
            {},
            EMPLOYEE_DATA
          ]
        end

        em = employees.all

        expect(em[0]).to be_an(Employee)
        expect(em[0].first_name).to eq("Bob")

        expect(em[1]).to be_an(Employee)
        expect(em[1].first_name).to eq("Esme")
      end
    end

    EMPLOYEE_DATA = <<-JSON
{
  "isError": false,
  "Status": 0,
  "Message": "The requested processed successfully.",
  "Result": [
    {
      "EmployeeId": {
        "DisplayValue": "1",
        "FieldHistory": [

        ]
      },
      "Title": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "FirstName": {
        "DisplayValue": "Bob",
        "FieldHistory": [
          
        ]
      },
      "LastName": {
        "DisplayValue": "Smith",
        "FieldHistory": [
          
        ]
      },
      "OtherName": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "KnownAs": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "EmailId": {
        "DisplayValue": "bob@example.com",
        "FieldHistory": [
          
        ]
      },
      "StartDate": {
        "DisplayValue": "2015-01-01",
        "FieldHistory": [
          
        ]
      },
      "DateOfBirth": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "JobRole": {
        "DisplayValue": "Admin",
        "FieldHistoryForJobRole": [
          
        ]
      },
      "Company": {
        "DisplayValue": "Example Corp",
        "FieldHistory": [

        ]
      },
      "Location": {
        "DisplayValue": "London",
        "FieldHistory": [
        ]
      },
      "Department": {
        "DisplayValue": "Design",
        "FieldHistory": [
        ]
      },
      "JobRoleChangeDate": {
        "DisplayValue": ""
      },
      "ReportsTo": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "NISNumber": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "Nationality": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "EmploymentType": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "EmployeeStatus": {
        "DisplayValue": "1"
      },
      "HolidayAllowanceDays": {
        "DisplayValue": "0.00"
      },
      "HolidayAllowanceMins": {
        "DisplayValue": "0"
      },
      "NoticePeriod": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "ProbationEndDate": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "Gender": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "ContactDetail": {
        "Address": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "WorkPhoneNumber": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PersonalPhoneNumber": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        }
      },
      "OtherContact": [
        
      ],
      "RightToWork": [
        
      ],
      "BackgroundDetail": [
        
      ],
      "BankDetail": {
        "BankName": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BankAddress": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BankCode": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "AccountNumber": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "AccountName": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        }
      },
      "EmploymentDetail": {
        "PayrollCompany": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PayrollID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "TimeAndAttendanceID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "RotaID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "CRMID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "ATSID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PerformanceID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BenefitsID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System1ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System2ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System3ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        }
      },
      "LeavingDate": "",
      "ReasonForLeaving": "",
      "EmployeeImage": "",
      "APIColumn1": "",
      "APIColumn2": "",
      "APIColumn3": "",
      "APIColumn4": "",
      "APIColumn5": "",
      "lstFieldHistoryJobrole": null
    },
    {
      "EmployeeId": {
        "DisplayValue": "2",
        "FieldHistory": [
          
        ]
      },
      "Title": {
        "DisplayValue": "Ms",
        "FieldHistory": [
          
        ]
      },
      "FirstName": {
        "DisplayValue": "Esme",
        "FieldHistory": [
          
        ]
      },
      "LastName": {
        "DisplayValue": "Weatherwax",
        "FieldHistory": [
          
        ]
      },
      "OtherName": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "KnownAs": {
        "DisplayValue": "Granny Weatherwax",
        "FieldHistory": [
        ]
      },
      "EmailId": {
        "DisplayValue": "granny@example.com",
        "FieldHistory": [
        ]
      },
      "StartDate": {
        "DisplayValue": "1900-12-31",
        "FieldHistory": [
          
        ]
      },
      "DateOfBirth": {
        "DisplayValue": "1876-01-01",
        "FieldHistory": [
          
        ]
      },
      "JobRole": {
        "DisplayValue": "Witch",
        "FieldHistoryForJobRole": [
          
        ]
      },
      "Company": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "Location": {
        "DisplayValue": "The Ramtops",
        "FieldHistory": [
          
        ]
      },
      "Department": {
        "DisplayValue": "Management",
        "FieldHistory": [
          
        ]
      },
      "JobRoleChangeDate": {
        "DisplayValue": ""
      },
      "ReportsTo": {
        "DisplayValue": "Bob Smith",
        "FieldHistory": [
          
        ]
      },
      "NISNumber": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "Nationality": {
        "DisplayValue": "British",
        "FieldHistory": [
          
        ]
      },
      "EmploymentType": {
        "DisplayValue": "Full Time",
        "FieldHistory": [
          
        ]
      },
      "EmployeeStatus": {
        "DisplayValue": "1"
      },
      "HolidayAllowanceDays": {
        "DisplayValue": "0.00"
      },
      "HolidayAllowanceMins": {
        "DisplayValue": "0"
      },
      "NoticePeriod": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "ProbationEndDate": {
        "DisplayValue": "",
        "FieldHistory": [
          
        ]
      },
      "Gender": {
        "DisplayValue": "Male",
        "FieldHistory": [
          
        ]
      },
      "ContactDetail": {
        "Address": {
          "DisplayValue": "A House, The Ramtops",
          "FieldHistory": [

          ]
        },
        "WorkPhoneNumber": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PersonalPhoneNumber": {
          "DisplayValue": "123 456 789",
          "FieldHistory": [
            
          ]
        }
      },
      "OtherContact": [
        
      ],
      "RightToWork": [
        {
          "DocumentType": {
            "DisplayValue": "Passport"
          },
          "DocumentId": {
            "DisplayValue": ""
          },
          "ValidFrom": {
            "DisplayValue": ""
          },
          "ValidTo": {
            "DisplayValue": ""
          },
          "Duration": {
            "DisplayValue": ""
          },
          "RightToWorkComments": {
            "DisplayValue": "GB passport"
          }
        }
      ],
      "BackgroundDetail": [
        
      ],
      "BankDetail": {
        "BankName": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BankAddress": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BankCode": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "AccountNumber": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "AccountName": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        }
      },
      "EmploymentDetail": {
        "PayrollCompany": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PayrollID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "TimeAndAttendanceID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "RotaID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "CRMID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "ATSID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "PerformanceID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "BenefitsID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System1ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System2ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        },
        "System3ID": {
          "DisplayValue": "",
          "FieldHistory": [
            
          ]
        }
      },
      "LeavingDate": "",
      "ReasonForLeaving": "",
      "EmployeeImage": "",
      "APIColumn1": "",
      "APIColumn2": "",
      "APIColumn3": "",
      "APIColumn4": "",
      "APIColumn5": "",
      "lstFieldHistoryJobrole": null
    }
  ]
}
    JSON
  end
end

