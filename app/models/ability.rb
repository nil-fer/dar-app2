# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, :to => :crud

    user ||= User.new # guest user (not logged in)

    if user.role == 'admin'
      can :manage, :all

    elsif user.role == 'retailer'
      can :manage, [Outlet, Company, User], :user_id => user.id
      #can :manage, Outlet

    elsif user.role == 'manager'
      can :manage, [Batch, Product, User], :user_id => user.id
      can [:read, :update], Outlet, :user_id => user.id

    else
      can :read, [Outlet, Batch, Product]
      cannot :index, User
    end
  end
end
