class InviteMailer < ApplicationMailer
  
  #招待メール
  def invite_email
    #招待者入力フォームで入力したemailを利用して送信する。
<<<<<<< HEAD
    @inviter = params[:invite]
    mail to:  inviter.email,
         subject: '招待メール'
=======
    @inviter = invite #招待される人の情報
    mail to:  invite.email,
    subject: '招待メール'
>>>>>>> 515f338e81b35efba7b09cb1d675cb8d837edc0a
  end
end
