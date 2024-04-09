class NotificationMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def new_like_notification(user, tweet)
    @user = user
    @tweet = tweet
    mail(to: @user.email, subject: 'Someone liked your tweet!')
  end

  def new_comment_notification(user, comment)
    @user = user
    @comment = comment
    mail(to: @user.email, subject: 'Someone commented on your tweet!')
  end
end
