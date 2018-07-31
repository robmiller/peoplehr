require "spec_helper"

module PeopleHR
  describe Employees do
    let(:stubs) { Faraday::Adapter::Test::Stubs.new }
    let(:test) do
      stubs.post("/Employee") do |env|
        [
          200,
          {},
          EMPLOYEE_DATA
        ]
      end

      Faraday.new do |builder|
        builder.adapter :test, stubs
      end
    end

    let(:api_key) { "abc123abc123abc123" }

    let(:api) { API.new(api_key: api_key, connection: test) }

    let(:employees) { Employees.new(api: api) }

    describe "#all" do
      it "lists all employees" do
        expect(employees.all.length).to eq(2)
      end

      it "returns Employee objects" do
        em = employees.all

        expect(em[0]).to be_an(Employee)
        expect(em[0].first_name).to eq("Bob")

        expect(em[1]).to be_an(Employee)
        expect(em[1].first_name).to eq("Esme")
      end
    end

    describe "#each" do
      it "iterates over employees" do
        employees.each do |employee|
          expect(employee).to be_an(Employee)
        end
      end

      it "implements enumerable methods" do
        employee = employees.find { |e| e.first_name == "Bob" }

        expect(employee.first_name).to eq("Bob")
      end
    end

    EMPLOYEE_DATA = File.read("spec/fixtures/employee_details.json")
  end
end

