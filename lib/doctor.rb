class Doctor
  attr_reader :name

  @@all = []

  def initialize(doctor)
    @name = doctor
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end

  def appointments
    Appointment.all.select {|app| app.doctor == self}
  end

  def patients
    self.appointments.map {|app| app.patient}
  end

end
