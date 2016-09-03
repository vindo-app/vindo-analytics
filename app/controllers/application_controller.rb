class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    force_ssl if: :ssl_works?
    def ssl_works?
        !Rails.env.development?
    end
end
