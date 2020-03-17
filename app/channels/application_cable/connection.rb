module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_tutor, :current_student

    def connect
      if current_student
        self.current_student = find_verified_student
      elsif current_tutor
        self.current_tutor = find_verified_tutor
      end
    end

    private

    def find_verified_student
      if verified_student = Student.find_by(id: cookies.signed['student.id'])
        verified_student
      else
        reject_unauthorized_connection
      end
    end

    def find_verified_tutor
      if verified_tutor = Tutor.find_by(id: cookies.signed['tutor.id'])
        verified_tutor
      else
        reject_unauthorized_connection
      end
    end

  end
end
