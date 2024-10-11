class Oda::Aktør < Oda::OdaRecord
  include Synchronizable

  has_many :stemmer
  has_many :afstemninger, through: :stemmer

  has_many :fra_aktør_aktører, foreign_key: :fraaktør_id, class_name: "Oda::AktørAktør"
  has_many :til_aktør_aktører, foreign_key: :tilaktør_id, class_name: "Oda::AktørAktør"
  has_many :fraaktører, through: :til_aktør_aktører
  has_many :tilaktører, through: :fra_aktør_aktører

  belongs_to :type, class_name: "Oda::Aktørtype"
  belongs_to :periode, optional: true, counter_cache: true

  scope :alphabetical, -> { order(:navn) }
  scope :chronological, -> { order(opdateringsdato: :desc) }
  scope :matches, ->(search) { where("oda_aktører.navn Like ?", "%#{search}%") if search.present? }
  scope :actortype, ->(id) { joins(:type).where(type: { id: }) }

  def relationer(rolle)
    from = fraaktører.where(oda_aktør_aktører: { rolle_id: rolle.id })
    to   = tilaktører.where(oda_aktør_aktører: { rolle_id: rolle.id })
    (from + to).uniq
  end
  

  def picture
    nokogiri.css("pictureMiRes").first.content
  rescue
    nil
  end

  def email = nokogiri.css("email").first&.content
  def phone = nokogiri.css("mobilePhone, ministerPhone, phoneFolketinget").first&.content
  def member_data = nokogiri.css("memberData").first&.content&.html_safe

  def nokogiri
    @nokogiri ||= Nokogiri.XML(biografi)
  end
end
