class Ability
  include CanCan::Ability

  def initialize(user)              
    if user && user.role == "admin"
      can :manage, :all
    else

    end
  end

end
