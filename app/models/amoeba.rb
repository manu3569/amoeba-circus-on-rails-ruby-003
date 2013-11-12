class Amoeba < ActiveRecord::Base
  belongs_to :talent
  has_many :amoeba_acts
  has_many :acts, :through => :amoeba_acts

  def split(amoeba_1=nil, amoeba_2=nil)
    amoeba_1 = "Son of #{self.name}" if amoeba_1.blank?
    amoeba_2 = "Daughter of #{self.name}" if amoeba_2.blank?
    Amoeba.transaction do
      self.talent.amoebas.create!(name: amoeba_1, generation: self.generation + 1)
      self.talent.amoebas.create!(name: amoeba_2, generation: self.generation + 1)
      self.destroy!
    end
  end

end
