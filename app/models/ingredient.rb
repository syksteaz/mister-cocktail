class Ingredient < ActiveRecord::Base
  has_many :doses
  validates :name, uniqueness: true, presence: true, inclusion: { in: ["lemon","ice","mint leaves","gin","pepper","whisky","fruit","olive","martini","lemonade","sparkling water"]}

  before_destroy :check_for_cocktail


  private

  def check_for_cocktail
    unless cocktail.ingredients.nil?
      self.errors[:base] << "You can't delete an ingredient if it used by at least one cocktail."
      return false
    end
  end

end



