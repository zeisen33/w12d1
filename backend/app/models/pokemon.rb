# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pokemon < ApplicationRecord
   TYPES = [
      'fire',
      'electric',
      'normal',
      'ghost',
      'psychic',
      'water',
      'bug',
      'dragon',
      'grass',
      'fighting',
      'ice',
      'flying',
      'poison',
      'ground',
      'rock',
      'steel',
      'dark',
      'fairy'
   ].sort.freeze

   validates :image_url, presence: true
   validates :captured, inclusion: { in: [true, false] , message: "dude come on" }
   validates :name, uniqueness: {message: "'%{value}' is too bitchy of a name, try again"}, length: {in: 3..255}
   validates :number, uniqueness: {message: "id theft is not a joke."}, numericality: {greater_than: 0}
   validates :attack, :defense, numericality: {in:0..100}
   validates :poke_type, inclusion: {in: TYPES, message: "'%{value}' no new types please, we're already working so hard."}

   has_many :poke_moves,
      dependent: :destroy
   has_many :items,
      dependent: :destroy
   has_many :moves,
      through: :poke_moves,
      source: :move
end
