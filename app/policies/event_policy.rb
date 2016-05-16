class EventPolicy < ApplicationPolicy

  def create?
    user.admin? || user.moderator? || user.normal?
  end

  def update?
    user.admin? || user.moderator? || record.try(:organizer) == user
  end

end
