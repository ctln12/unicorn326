class ArchivesController < ApplicationController
  def index
    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    @archives = opentok.archives.all
  end

  def start
    session_id = params["archive"]["session_id"]
    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    options = { output_mode: :individual }
    archive = opentok.archives.create(session_id, options)
    archive_id = archive.id

    respond_to do |format|
      format.json { render json: { message: "Archive started", archiveId: archive_id } }
    end
  end

  def stop
    opentok = OpenTok::OpenTok.new(ENV['OPENTOK_API_KEY'], ENV['OPENTOK_SECRET_KEY'])
    archive_id = params["id"]
    opentok.archives.stop_by_id(archive_id)

    respond_to do |format|
      format.json { render json: { message: "Archive stopped", archiveId: archive_id } }
    end
  end
end
