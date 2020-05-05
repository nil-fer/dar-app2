# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)

      if user.role == 'admin'
        can :manage, :all

      elseif user.role == 'retailer'
        # can :manage, Outlet, user_id: user.id
        # can :index, User
        can :manage, :all

      elseif user.role == 'manager'
        can :crud, :all, user_id: user.id
    else
      can :read, [Outlet, Batch, Product]
    end
  end
end
