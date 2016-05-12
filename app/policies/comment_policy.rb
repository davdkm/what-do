class CommentPolicy < ApplicationPolicy

 def update?
   user.admin? || user.moderator? || record.try(:user) == user
 end

 def destroy?
   user.admin? || user.moderator? || record.try(:user) == user
 end
 def permitted_attributes
    if user.admin? || user.owner_of?(comment)
      [:content]
    end
  end

end
