class NoticeMailer < ApplicationMailer
    def notice_mailer(event)
        @event = event
        @event_user_email = @event.user.email

        mail to: @event_user_email, subject: "投稿の確認メール"
    end
end
