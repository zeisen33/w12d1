# == Schema Information
#
# Table name: moves
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Move < ApplicationRecord
   validates :name, uniqueness: {message: "come on man, be creative." }, presence: true

   has_many :poke_moves,
      dependent: :destroy
   has_many :pokemon,
      through: :poke_moves,
      source: :pokemon
end
