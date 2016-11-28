class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    send(@user.model_name.to_s.underscore) if @user
    can :read, :all
  end

  def admin
    can :manage, :all
  end

  def user
    can :read, :all
  end
end
