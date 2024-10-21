require "open-uri"

class SynchronizationJob < ApplicationJob
  limits_concurrency key: :synchronize

  RESOURCES = [
    Oda::Periode,
    Oda::Mødestatus,
    Oda::Mødetype,
    Oda::Møde,
    Oda::Sagskategori,
    Oda::Sagsstatus,
    Oda::Sagstype,
    Oda::Sag,
    Oda::Sagstrinstype,
    Oda::Sagstrinsstatus,
    Oda::Sagstrin,
    Oda::Afstemningstype,
    Oda::Afstemning,
    Oda::Aktørtype,
    Oda::Aktør,
    Oda::AktørAktørRolle,
    Oda::AktørAktør,
    Oda::Dokumentkategori,
    Oda::Dokumentstatus,
    Oda::Dokumenttype,
    Oda::Dokument,
    Oda::Dagsordenspunkt,
    Oda::DagsordenspunktDokument,
    Oda::DagsordenspunktSag,
    Oda::DokumentAktørRolle,
    Oda::DokumentAktør,
    Oda::Emneordstype,
    Oda::Emneord,
    Oda::EmneordDokument,
    Oda::EmneordSag,
    Oda::EntitetBeskrivelse,
    Oda::Fil,
    Oda::KolloneBeskrivelse,
    Oda::MødeAktør,
    Oda::Omtryk,
    Oda::SagAktørRolle,
    Oda::SagAktør,
    Oda::SagDokumentRolle,
    Oda::SagDokument,
    Oda::SagstrinAktørRolle,
    Oda::SagstrinAktør,
    Oda::SagstrinDokument,
    # Oda::Sambehandlinger,
    # Oda::SlettetMap,
    # Oda::Slettet,
    Oda::Stemmetype,
    Oda::Stemme
  ]

  def perform
    raise "restore backup before synchronization" if imported?

    RESOURCES.each do |entity|
      entity.synchronize
    end

    SearchAgent.all.each do |agent|
      SearchAgentJob.perform_later(agent)
    end
  end

  private
    def imported?
      Oda::Periode.sum(:aktører_count).zero?
    end
end
