 class InviteMailer < ApplicationMailer
   def new_user_invite(invite:, url:)
     #招待者入力フォームで入力したemailを利用して送信する。
     @invite = invite #招待される人の情報
     @url = url
     mail to: @invite.email, subject: "招待メール"
   end
 end