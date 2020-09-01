module ApplicationHelper
  def user_avatar(user, size=40)
    if user.avatar.attached?
      user.avatar.variant(resize: "#{size}x#{size}!")
    else
      "https://ui-avatars.com/api/?background=0D8ABC&color=fff&name=#{user.name}"
    end
  end
  def scenario_avatar(scenario, size=40)
    if scenario.avatar.attached?
      scenario.avatar.variant(resize: "#{size}x#{size}!")
    end
  end
end
