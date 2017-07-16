class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog=blog

    mail to: "ksk55jp@gmail.com",
      subject: '【Achieve】ブログが投稿されました'
  end
  #
  # DIVE11: send email to submit message in contact function
  #
  def sendmail_contact(contact)
    @contact=contact

    mail to: "#{contact.email}",
      subject: '【Achieve】お問い合わせありがとうございました'
  end
end
