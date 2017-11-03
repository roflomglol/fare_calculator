Rails.application.routes.draw do
  resources :fares, only: [] do
    collection do
      get '/:city/:kind/estimate', action: :estimate
    end
  end
end
