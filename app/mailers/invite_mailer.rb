class InviteMailer < ApplicationMailer
  
  #招待メール
  def invite_email
    #招待者入力フォームで入力したemailを利用して送信する。
    @inviter = invite #招待される人の情報
    mail to:  invite.email,
    subject: '招待メール'
  end
end
