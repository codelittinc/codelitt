class SiteController < ApplicationController

  def index

  end

  def services

  end

  def technologies

  end

  def contact
  end

  def email
    respond_to do |format|
      begin
        ContactMailer.contact_email(params).deliver!
        format.json { render json: true }
      rescue
        format.json {head 500}
      end
    end
  end

end
