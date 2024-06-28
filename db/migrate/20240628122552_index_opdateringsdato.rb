class IndexOpdateringsdato < ActiveRecord::Migration[8.0]
  def change
    add_index :oda_afstemnings, :opdateringsdato
    add_index :oda_afstemningstypes, :opdateringsdato
    add_index :oda_aktør_aktør_rolles, :opdateringsdato
    add_index :oda_aktør_aktørs, :opdateringsdato
    add_index :oda_dagsordenspunkt_dokuments, :opdateringsdato
    add_index :oda_dagsordenspunkt_sags, :opdateringsdato
    add_index :oda_dagsordenspunkts, :opdateringsdato
    add_index :oda_dokument_aktør_rolles, :opdateringsdato
    add_index :oda_dokument_aktørs, :opdateringsdato
    add_index :oda_dokuments, :opdateringsdato
    add_index :oda_dokumentkategoris, :opdateringsdato
    add_index :oda_dokumentstatuses, :opdateringsdato
    add_index :oda_dokumenttypes, :opdateringsdato
    add_index :oda_emneord_dokuments, :opdateringsdato
    add_index :oda_emneord_sags, :opdateringsdato
    add_index :oda_emneordstypes, :opdateringsdato
    add_index :oda_entitet_beskrivelses, :opdateringsdato
    add_index :oda_fils, :opdateringsdato
    add_index :oda_emneords, :opdateringsdato
    add_index :oda_kollone_beskrivelses, :opdateringsdato
    add_index :oda_møde_aktørs, :opdateringsdato
    add_index :oda_mødes, :opdateringsdato
    add_index :oda_mødestatuses, :opdateringsdato
    add_index :oda_mødetypes, :opdateringsdato
    add_index :oda_omtryks, :opdateringsdato
    add_index :oda_periodes, :opdateringsdato
    add_index :oda_sag_aktør_rolles, :opdateringsdato
    add_index :oda_sag_aktørs, :opdateringsdato
    add_index :oda_sag_dokument_rolles, :opdateringsdato
    add_index :oda_sag_dokuments, :opdateringsdato
    add_index :oda_sags, :opdateringsdato
    add_index :oda_sagskategoris, :opdateringsdato
    add_index :oda_sagsstatuses, :opdateringsdato
    add_index :oda_sagstrin_aktør_rolles, :opdateringsdato
    add_index :oda_sagstrin_aktørs, :opdateringsdato
    add_index :oda_sagstrin_dokuments, :opdateringsdato
    add_index :oda_sagstrins, :opdateringsdato
    add_index :oda_sagstrinsstatuses, :opdateringsdato
    add_index :oda_sagstrinstypes, :opdateringsdato
    add_index :oda_sambehandlingers, :opdateringsdato
    add_index :oda_slettet_maps, :opdateringsdato
    add_index :oda_slettets, :opdateringsdato
    add_index :oda_stemmes, :opdateringsdato
    add_index :oda_stemmetypes, :opdateringsdato
  end
end
