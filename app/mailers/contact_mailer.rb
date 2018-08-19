class ContactMailer < ApplicationMailer
    def contact_mailer(contact)
        @contact = contact

        mail to: "sonnabakananz@gmail.com", subject: "お問い合わせの確認メール"
    end

end
