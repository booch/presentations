IDEAS
=====

- Dependency injection of repository into controller tests

- I had GitHub CoPilot write almost all of this for me.

~~~ ruby
# app/controllers/application_controller.rb
class ApplicationController < ActionController::Base
  # Override this in tests
  def user_repo
    @user_repo ||= User
  end
end

# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def index
    @users = user_repo.all
  end
end

# spec/controllers/users_controller_spec.rb
describe UsersController do
  let(:user_repo) { double(:user_repo) }

  before do
    controller.stub(:user_repo).and_return(user_repo)
  end

  it "assigns @users" do
    users = [double(:user)]
    user_repo.stub(:all).and_return(users)

    get :index

    expect(assigns(:users)).to eq(users)
  end
end
~~~
