class Amoeba < ActiveRecord::Base
  belongs_to :talent
  has_many :amoeba_acts
  has_many :acts, :through => :amoeba_acts

  def split(amoeba_1, amoeba_2)
    self.talent.amoebas.create(name: amoeba_1, generation: self.generation + 1)
    self.talent.amoebas.create(name: amoeba_2, generation: self.generation + 1)
    self.destroy
  end
end
