class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope = Restaurant
      scope.all
    end
  end

  def show?
    true
  end

  # def new? # already defined in appliacation policy
  #   create?
  # end

  def create?
    true
  end

  def update?
    # Tools
    # user -> current_user
    # record -> restaurant instance
    user.admin || record.user == user
  end

  def destroy?
    user.admin || record.user == user
  end
end
