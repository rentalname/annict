# == Schema Information
#
# Table name: staffs
#
#  id         :integer          not null, primary key
#  person_id  :integer          not null
#  work_id    :integer          not null
#  name       :string           not null
#  role       :string           not null
#  role_other :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_staff_participations_on_person_id  (person_id)
#  index_staff_participations_on_work_id    (work_id)
#

class Staff < ActiveRecord::Base
  include DbActivityMethods
  include StaffCommon
end
