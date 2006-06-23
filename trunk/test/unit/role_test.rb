require File.dirname(__FILE__) + '/../test_helper'

class RoleTest < Test::Unit::TestCase
  fixtures :roles

  def test_should_create_role
    assert create_role.valid?
  end

  def test_should_require_login
    u = create_role(:login => nil)
    assert u.errors.on(:login)
  end

  def test_should_require_password
    u = create_role(:password => nil)
    assert u.errors.on(:password)
  end

  def test_should_require_password_confirmation
    u = create_role(:password_confirmation => nil)
    assert u.errors.on(:password_confirmation)
  end

  def test_should_require_email
    u = create_role(:email => nil)
    assert u.errors.on(:email)
  end

  def test_should_reset_password
    roles(:quentin).update_attributes(:password => 'new password', :password_confirmation => 'new password')
    assert_equal roles(:quentin), Role.authenticate('quentin', 'new password')
  end

  def test_should_not_rehash_password
    roles(:quentin).update_attribute(:login, 'quentin2')
    assert_equal roles(:quentin), Role.authenticate('quentin2', 'quentin')
  end

  def test_should_authenticate_role
    assert_equal roles(:quentin), Role.authenticate('quentin', 'quentin')
  end

  protected
  def create_role(options = {})
    Role.create({ :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options))
  end
end
