class Oda::ImportsController < ApplicationController
  def show
  end

  def create
    puts params[:backup].length
    params[:backup].each do |upload|
      next unless upload.present?
      puts upload.original_filename
      rows = JSON.parse(upload.read)
      inserts = rows.collect do |row|
        row.transform_keys do |key|
          case
          when key == "id"
             key
          when key == "type"
             "typenavn"
          when key.end_with?("id")
             key.delete_suffix("id") + "_id"
          else
             key
          end
        end
      end
      resource = File.basename(upload.original_filename, ".json")
      Kernel.const_get("Oda::#{resource}").insert_all(inserts)
    end

    redirect_to oda_import_url
  end
end
