class AddInflections < ActiveRecord::Migration[8.0]
  def change
    rename_table :oda_afstemnings, :oda_afstemninger
    rename_table :oda_afstemningstypes, :oda_afstemningstyper
    rename_table :oda_aktørs, :oda_aktører
    rename_table :oda_aktør_aktørs, :oda_aktør_aktører
    rename_table :oda_aktør_aktør_rolles, :oda_aktør_aktør_roller
    rename_table :oda_aktørtypes, :oda_aktørtyper
    rename_table :oda_dagsordenspunkts, :oda_dagsordenspunkter
    rename_table :oda_dagsordenspunkt_dokuments, :oda_dagsordenspunkt_dokumenter
    rename_table :oda_dagsordenspunkt_sags, :oda_dagsordenspunkt_sager
    rename_table :oda_dokuments, :oda_dokumenter
    rename_table :oda_dokument_aktørs, :oda_dokument_aktører
    rename_table :oda_dokument_aktør_rolles, :oda_dokument_aktør_roller
    rename_table :oda_dokumentkategoris, :oda_dokumentkategorier
    rename_table :oda_dokumentstatuses, :oda_dokumentstatuser
    rename_table :oda_dokumenttypes, :oda_dokumenttyper
    rename_table :oda_emneords, :oda_emneord
    rename_table :oda_emneord_dokuments, :oda_emneord_dokumenter
    rename_table :oda_emneord_sags, :oda_emneord_sager
    rename_table :oda_emneordstypes, :oda_emneordstyper
    rename_table :oda_entitet_beskrivelses, :oda_entitet_beskrivelser
    rename_table :oda_fils, :oda_filer
    # rename_table :oda_id_maps, :oda_id_maps
    rename_table :oda_kollone_beskrivelses, :oda_kollone_beskrivelser
    rename_table :oda_mødes, :oda_møder
    rename_table :oda_møde_aktørs, :oda_møde_aktører
    rename_table :oda_mødestatuses, :oda_mødestatuser
    rename_table :oda_mødetypes, :oda_mødetyper
    rename_table :oda_omtryks, :oda_omtryk
    rename_table :oda_periodes, :oda_perioder
    rename_table :oda_sags, :oda_sager
    rename_table :oda_sag_aktørs, :oda_sag_aktører
    rename_table :oda_sag_aktør_rolles, :oda_sag_aktør_roller
    rename_table :oda_sag_dokuments, :oda_sag_dokumenter
    rename_table :oda_sag_dokument_rolles, :oda_sag_dokument_roller
    rename_table :oda_sagskategoris, :oda_sagskategorier
    rename_table :oda_sagsstatuses, :oda_sagsstatuser
    rename_table :oda_sagstrins, :oda_sagstrin
    rename_table :oda_sagstrin_aktørs, :oda_sagstrin_aktører
    rename_table :oda_sagstrin_aktør_rolles, :oda_sagstrin_aktør_roller
    rename_table :oda_sagstrin_dokuments, :oda_sagstrin_dokumenter
    rename_table :oda_sagstrinsstatuses, :oda_sagstrinsstatuser
    rename_table :oda_sagstrinstypes, :oda_sagstrinstyper
    rename_table :oda_sagstypes, :oda_sagstyper
    rename_table :oda_sambehandlingers, :oda_sambehandlinger
    # rename_table :oda_slettets, :oda_slettets
    # rename_table :oda_slettet_maps, :oda_slettet_maps
    rename_table :oda_stemmes, :oda_stemmer
    rename_table :oda_stemmetypes, :oda_stemmetyper

    rename_column :oda_emneord, :emneord_sags_count, :emneord_sager_count
    rename_column :oda_emneord, :emneord_dokuments_count, :emneord_dokumenter_count
    rename_column :oda_perioder, :aktørs_count, :aktører_count
    rename_column :oda_perioder, :mødes_count, :møder_count
    rename_column :oda_perioder, :sags_count, :sager_count
  end
end
