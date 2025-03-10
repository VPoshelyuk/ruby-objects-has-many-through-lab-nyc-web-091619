class Patient
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def appointments
        Appointment.all.select{|appointment| appointment.patient == self}
    end

    def doctors
        doctors_list = Appointment.all.select{|appointment| appointment.patient == self}
        doctors_list.map do |appointment|
            appointment.doctor
        end
    end

end