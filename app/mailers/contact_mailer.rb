class ContactMailer < ActionMailer::Base

  def contact_email(params)
    @params = params
    mail(to: "carlos@codelitt.com", subject: 'A user has contacted us!', from: @params["email"])
  end
end
