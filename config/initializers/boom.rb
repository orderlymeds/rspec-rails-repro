if ENV["GO_BOOM"]
  Rails.application.credentials.fetch(:omg)
end
