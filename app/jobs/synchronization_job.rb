require "open-uri"

class SynchronizationJob < ApplicationJob
  limits_concurrency key: :synchronize

  RESOURCES = [
    Oda::Periode,

    Oda::Aktørtype,
    Oda::Aktør,

    Oda::Sagskategori,
    Oda::Sagsstatus,
    Oda::Sagstype,
    Oda::Sag,

    Oda::Sagstrinsstatus,
    Oda::Sagstrinstype,
    Oda::Sagstrin,

    Oda::Mødestatus,
    Oda::Mødetype,
    Oda::Møde,

    Oda::Dokumentkategori,
    Oda::Dokumentstatus,
    Oda::Dokumenttype,
    Oda::Dokument,

    Oda::Afstemningstype,
    Oda::Afstemning,

    Oda::Emneordstype,
    Oda::Emneord,

    Oda::AktørAktør,
    Oda::AktørAktørRolle,
    Oda::DagsordenspunktDokument,
    Oda::Dagsordenspunkt,
    Oda::DagsordenspunktSag,
    Oda::DokumentAktør,
    Oda::DokumentAktørRolle,
    Oda::EmneordDokument,
    Oda::EmneordSag,
    Oda::EntitetBeskrivelse,
    Oda::Fil,
    Oda::KolloneBeskrivelse,
    Oda::MødeAktør,
    Oda::Omtryk,
    Oda::SagAktør,
    Oda::SagAktørRolle,
    Oda::SagDokument,
    Oda::SagDokumentRolle,
    Oda::SagstrinAktør,
    Oda::SagstrinAktørRolle,
    Oda::SagstrinDokument,
    Oda::Stemmetype,
    Oda::Stemme

    # TODO: Find out why these give 404:
    #   Oda::Sambehandlinger
    #   Oda::SlettetMap
    #   Oda::Slettet

    # TODO: Find out whats up with these:
    #   Oda::Almdel,
    #   Oda::Aktstykke,
    #   Oda::Debat,
    #   Oda::EUsag,
    #   Oda::Forslag,

    # does not have `opdateringsdato`:
    #   Oda::IdMap,
  ]

  def perform
    RESOURCES.each do |entity|
      puts entity
      entity.synchronize
    end
  end
end
