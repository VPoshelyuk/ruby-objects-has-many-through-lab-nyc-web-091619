class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def appointments
        Appointment.all.select{|appointment| appointment.doctor == self}
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients
        patients_list = Appointment.all.select{|appointment| appointment.doctor == self}
        patients_list.map do |appointment|
            appointment.patient
        end
    end
end