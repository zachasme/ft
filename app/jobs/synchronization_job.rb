require "open-uri"

class SynchronizationJob < ApplicationJob
  limits_concurrency key: :synchronize

  RESOURCES = [
    Oda::Fil,
    Oda::Sagstrinsstatus,
    # Oda::IdMap,
    Oda::Sagstrinstype,
    Oda::KolloneBeskrivelse,
    Oda::Sagstrin,
    Oda::MødeAktør,
    Oda::Afstemning,
    Oda::Omtryk,
    Oda::Aktørtype,
    Oda::SagAktørRolle,
    Oda::Aktør,
    Oda::SagAktør,
    Oda::AktørAktørRolle,
    Oda::SagDokumentRolle,
    Oda::AktørAktør,
    Oda::SagDokument,
    Oda::Dagsordenspunkt,
    Oda::SagstrinAktørRolle,
    Oda::Dokumentkategori,
    Oda::SagstrinAktør,
    Oda::Dokumentstatus,
    Oda::SagstrinDokument,
    Oda::Dokumenttype,
    # Oda::Sambehandlinger,
    Oda::Dokument,
    # Oda::SlettetMap,
    Oda::DagsordenspunktDokument,
    Oda::Afstemningstype,
    # Oda::Slettet,
    Oda::DagsordenspunktSag,
    Oda::Mødestatus,
    Oda::Stemmetype,
    Oda::DokumentAktørRolle,
    Oda::Mødetype,
    Oda::Stemme,
    Oda::DokumentAktør,
    Oda::Periode,
    # Oda::SyncLogger,
    Oda::Emneordstype,
    Oda::Møde,
    Oda::Emneord,
    Oda::Sagskategori,
    Oda::EmneordDokument,
    Oda::Sagsstatus,
    Oda::EmneordSag,
    Oda::Sagstype,
    Oda::EntitetBeskrivelse,
    Oda::Sag
  ]

  def perform
    RESOURCES.each do |entity|
      puts entity
      entity.synchronize
    end

    SearchAgent.all.each do |agent|
      puts agent
      SearchAgentJob.perform_later(agent)
    end
    puts "Done <3"
  end
end
