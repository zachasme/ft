class UpdatesController < ApplicationController
  def index
    @entities = [
      Oda::Afstemning,
      Oda::Afstemningstype,
      Oda::AktørAktørRolle,
      Oda::AktørAktør,
      Oda::Aktør,
      Oda::Aktstykke,
      Oda::DagsordenspunktDokument,
      Oda::DagsordenspunktSag,
      Oda::Dagsordenspunkt,
      Oda::DokumentAktørRolle,
      Oda::DokumentAktør,
      Oda::Dokument,
      Oda::Dokumentkategori,
      Oda::Dokumentstatus,
      Oda::Dokumenttype,
      Oda::EUsag,
      Oda::EmneordDokument,
      Oda::EmneordSag,
      Oda::Emneord,
      Oda::Emneordstype,
      Oda::EntitetBeskrivelse,
      Oda::Fil,
      Oda::Emneord,
      # Oda::IdMap,
      Oda::KolloneBeskrivelse,
      Oda::MødeAktør,
      Oda::Møde,
      Oda::Mødestatus,
      Oda::Mødetype,
      Oda::Omtryk,
      Oda::Periode,
      Oda::SagAktørRolle,
      Oda::SagAktør,
      Oda::SagDokumentRolle,
      Oda::SagDokument,
      Oda::Sag,
      Oda::Sagskategori,
      Oda::Sagsstatus,
      Oda::SagstrinAktørRolle,
      Oda::SagstrinAktør,
      Oda::SagstrinDokument,
      Oda::Sagstrin,
      Oda::Sagstrinsstatus,
      Oda::Sagstrinstype,
      Oda::Sambehandlinger,
      Oda::SlettetMap,
      Oda::Slettet,
      Oda::Stemme,
      Oda::Stemmetype
    ]
  end
end