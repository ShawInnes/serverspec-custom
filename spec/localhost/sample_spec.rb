require 'spec_helper'

describe user('shaw') do
  it { should be_me }
end

module Serverspec::Type
  class User < Base
    def me?
      @runner.check_user_me(@name)
    end
  end
end

class Specinfra::Command::Base::User < Specinfra::Command::Base
  class << self
    def check_me(user)
      "whoami | grep -- '#{user}'"
    end
  end
end
