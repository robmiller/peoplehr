module PeopleHR
  class Employee
    include Virtus.value_object

    values do
      attribute :id,                 String
      attribute :title,              String
      attribute :first_name,         String
      attribute :last_name,          String
      attribute :email,              String
      attribute :start_date,         Date
      attribute :probation_end_date, Date
      attribute :date_of_birth,      Date
      attribute :job_role,           String
      attribute :company,            String
      attribute :location,           String
      attribute :department,         String
      attribute :manager_id,         String
    end

    def full_name
      "#{first_name} #{last_name}"
    end
  end
end
