require "spec_helper"

module PeopleHR
  describe Employee do
    let(:employee) do
      Employee.new(
        id:                 "PW6",
        title:              "Mr.",
        first_name:         "Rob",
        last_name:          "Miller",
        email:              "rob@bigfish.co.uk",
        start_date:         "2018-01-01",
        probation_end_date: "2018-03-01",
        date_of_birth:      "1950-01-01",
        job_role:           "Head of Everything",
        company:            "Big Fish",
        location:           "London",
        department:         "Operations",
        manager_id:         "PW7"
      )
    end

    it "has an employee ID" do
      expect(employee.id).to eq("PW6")
    end

    it "has a title" do
      expect(employee.title).to eq("Mr.")
    end

    it "has a first name" do
      expect(employee.first_name).to eq("Rob")
    end

    it "has a last name" do
      expect(employee.last_name).to eq("Miller")
    end

    it "has a full name" do
      expect(employee.full_name).to eq("Rob Miller")
    end

    it "has an email" do
      expect(employee.email).to eq("rob@bigfish.co.uk")
    end

    it "has a start date" do
      expect(employee.start_date).to eq(Date.new(2018, 1, 1))
    end

    it "has a date of birth" do
      expect(employee.date_of_birth).to eq(Date.new(1950, 1, 1))
    end

    it "has a job role" do
      expect(employee.job_role).to eq("Head of Everything")
    end

    it "has a company" do
      expect(employee.company).to eq("Big Fish")
    end

    it "has a location" do
      expect(employee.location).to eq("London")
    end

    it "has a department" do
      expect(employee.department).to eq("Operations")
    end

    it "has a probation end date" do
      expect(employee.probation_end_date).to eq(Date.new(2018, 3, 1))
    end

    it "has a manager ID" do
      expect(employee.manager_id).to eq('PW7')
    end
  end
end
