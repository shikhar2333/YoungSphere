module ApplicationHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      "https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=#{user.name}"
    end
  end
end
