Rails.application.routes.draw do
  post '/process', to: 'process#create'
end
