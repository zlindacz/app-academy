class CatRentalRequest < ActiveRecord::Base
  validates :cat_id, :start_date, :end_date, presence: true
  validate :overlapping_approved_requests

  belongs_to :cat

  def overlapping_requests
    CatRentalRequest.find_by_sql(<<-SQL)
      SELECT *
      FROM cat_rental_requests AS request
      JOIN cat_rental_requests AS other_requests
        ON other_requests.cat_id = request.cat_id
      WHERE request.id = #{self.id}
        AND request.id != other_requests.id
        AND ((other_requests.start_date BETWEEN request.start_date AND request.end_date)
        OR (request.start_date BETWEEN other_requests.start_date AND other_requests.end_date))
    SQL
  end

  def overlapping_approved_requests
    if status == "APPROVED"
      overlaps = overlapping_requests.select { |request| request.status == "APPROVED" }
      unless overlaps.empty?
        errors["reservation time"] << "cannot overlap"
      end
    end
  end

  def approve!
    params = {id: self.id, cat_id: self.cat_id, start_date: self.start_date, end_date: self.end_date, status: "APPROVED"}
    self.update!(params)
  end

  def deny!
    self.status = "DENIED"
    self.save!
  end

  def pending?
    self.status == "PENDING"
  end
end
