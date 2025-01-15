class Contact < ApplicationRecord
  validates_presence_of :kind
 # validates_presence_of :address

 #  paginates_per 5
 belongs_to :kind, optional: true
 has_many :phones # plural pois são muitos
 has_one :address
 accepts_nested_attributes_for :phones, allow_destroy: true
 accepts_nested_attributes_for :address, update_only: true

  # def author
  #   "Gabi"
  # end


  # def kind_description
  #   self.kind.description
  # end

  # def as_json(options = {}) # reescrita do as_json para tornar padrão para todas as api deste model
  #   super(# invoca o as_json original
  #     methods: [ :author, :kind_description ], # métodos declarados acima
  #     root: true,
  #       # include: :kind #traz todo o objeto aninhado
  #       # { kind: { only: :description } } #traz somente o atributo description
  #     )
  # end
  #

  # def hello
  #   I18n.t("hello")
  # end

  # def bithdate_br
  #   I18n.l(self.birthdate) unless self.birthdate.blank?
  # end

  # def to_br
  #   {
  #     name: self.name,
  #     birthdate: (I18n.l(self.birthdate) unless self.birthdate.blank?),
  #     email: self.email
  #   }
  # end

  def as_json(options = {})
    super(options).merge({
      "birthdate" => (I18n.l(self.birthdate) unless self.birthdate.blank?)
    })
  end
end
