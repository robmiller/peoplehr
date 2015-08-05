module PeopleHR
  class Employees
    def initialize(api:)
      @api = api
    end

    def all
      transformation =
        t(:extract_result) >>
        t(
          :map_array,
          t(
            :map_values,
            t(:extract_display_value)
          )
        ) >>
        t(
          :map_array,
          t(
            :accept_keys,
            [
              "EmployeeId",
              "FirstName",
              "LastName",
              "Title",
              "EmailId",
              "StartDate",
              "DateOfBirth",
              "JobRole",
              "Company",
              "Location",
              "Department",
            ]
          ) >>
          t(
            :map_keys,
            -> k {
              k.gsub(/::/, '/')
                .gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
                .gsub(/([a-z\d])([A-Z])/,'\1_\2')
                .tr("-", "_")
                .downcase
            }
          ) >>
          t(:symbolize_keys) >>
          t(:rename_keys, { employee_id: :id }) >>
          t(:convert_to_employee)
        )

      transformation.call(api_data)
    end

    private

    attr_reader :api

    def api_data
      api.request("GetAllEmployeeDetail", "IncludeLeavers" => false)
    end

    def t(*args)
      Transformations[*args]
    end

    module Transformations
      extend Transproc::Registry

      import Transproc::HashTransformations
      import Transproc::ArrayTransformations

      def self.extract_result(hash)
        hash["Result"]
      end

      def self.extract_display_value(hash)
        if hash.is_a?(Hash)
          hash["DisplayValue"]
        end
      end

      def self.convert_to_employee(hash)
        Employee.new(hash)
      end
    end
  end
end
