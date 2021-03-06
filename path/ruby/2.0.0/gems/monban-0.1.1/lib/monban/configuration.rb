module Monban
  # Configuration options for Monban
  # @since 0.0.15
  class Configuration
    attr_accessor :user_token_field, :user_token_store_field
    attr_accessor :hashing_method, :token_comparison, :user_lookup_field
    attr_accessor :sign_in_notice
    attr_accessor :sign_in_service, :sign_up_service, :sign_out_service
    attr_accessor :authentication_service, :password_reset_service
    attr_accessor :failure_app
    attr_accessor :creation_method, :find_method
    attr_accessor :no_login_handler, :no_login_redirect

    attr_writer :user_class

    def initialize
      setup_class_defaults
      setup_token_hashing
      setup_notices
      setup_services
      setup_requirements
    end

    # Default creation method. Can be overriden via {Monban.configure}
    #
    # @see #creation_method=
    def default_creation_method
      ->(params) { Monban.user_class.create(params) }
    end

    # Default hashing method. Can be overriden via {Monban.configure}
    #
    # @see #hashing_method=
    def default_hashing_method
      ->(token) do
        if token.present?
          BCrypt::Password.create(token)
        else
          token
        end
      end
    end

    # Default find method. Can be overriden via {Monban.configure}
    #
    # @see #find_method=
    # @see Monban.user_class
    def default_find_method
      ->(params) { Monban.user_class.find_by(params) }
    end

    # Default token comparison method. Can be overriden via {Monban.configure}
    #
    # @see #token_comparison=
    def default_token_comparison
      ->(digest, undigested_token) do
        BCrypt::Password.new(digest) == undigested_token
      end
    end

    # Default handler when user is not logged in. Can be overriden via {Monban.configure}
    #
    # @see #no_login_handler=
    # @see #sign_in_notice
    # @see #no_login_redirect
    def default_no_login_handler
      ->(controller) do
        controller.flash.notice = Monban.config.sign_in_notice
        controller.redirect_to Monban.config.no_login_redirect
      end
    end

    # User class. Can be overriden via {Monban.configure}
    #
    # @see #user_class=
    def user_class
      @user_class.constantize
    end

    private

    def setup_token_hashing
      @hashing_method = default_hashing_method
      @token_comparison = default_token_comparison
    end

    def setup_notices
      @sign_in_notice = 'You must be signed in'
    end

    def setup_class_defaults
      @user_class = 'User'
      @user_token_field = :password
      @user_token_store_field = :password_digest
      @user_lookup_field = :email
      @creation_method = default_creation_method
      @find_method = default_find_method
      @no_login_redirect = { controller: '/sessions', action: 'new' }
      @no_login_handler = default_no_login_handler
    end

    def setup_services
      @authentication_service = Monban::Services::Authentication
      @sign_in_service = Monban::Services::SignIn
      @sign_up_service = Monban::Services::SignUp
      @sign_out_service = Monban::Services::SignOut
      @password_reset_service = Monban::Services::PasswordReset
    end

    def setup_requirements
      @failure_app = lambda{|e|[401, {"Content-Type" => "text/plain"}, ["Authorization Failed"]] }
    end
  end
end
