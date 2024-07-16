# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, "\\1en"
#   inflect.singular /^(ox)en/i, "\\1"
#   inflect.irregular "person", "people"
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym "RESTful"
# end

ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular "afstemning", "afstemninger"
  inflect.irregular "afstemningstype", "afstemningstyper"
  inflect.irregular "aktør", "aktører"
  inflect.irregular "aktørtype", "aktørtyper"
  inflect.irregular "beskrivelse", "beskrivelser"
  inflect.irregular "dagsordenspunkt", "dagsordenspunkter"
  inflect.irregular "dokument", "dokumenter"
  inflect.irregular "dokumentkategori", "dokumentkategorier"
  inflect.irregular "dokumentstatus", "dokumentstatuser"
  inflect.irregular "dokumenttype", "dokumenttyper"
  inflect.irregular "emneord", "emneord"
  inflect.irregular "emneordstype", "emneordstyper"
  inflect.irregular "fil", "filer"
  inflect.irregular "møde", "møder"
  inflect.irregular "mødestatus", "mødestatuser"
  inflect.irregular "mødetype", "mødetyper"
  inflect.irregular "omtryk", "omtryk"
  inflect.irregular "periode", "perioder"
  inflect.irregular "rolle", "roller"
  inflect.irregular "sag", "sager"
  inflect.irregular "sagskategori", "sagskategorier"
  inflect.irregular "sagsstatus", "sagsstatuser"
  inflect.irregular "sagstrin", "sagstrin"
  inflect.irregular "sagstrinsstatus", "sagstrinsstatuser"
  inflect.irregular "sagstrinstype", "sagstrinstyper"
  inflect.irregular "sagstype", "sagstyper"
  inflect.irregular "sambehandling", "sambehandlinger"
  inflect.irregular "stemme", "stemmer"
  inflect.irregular "stemmetype", "stemmetyper"
end
