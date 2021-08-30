Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/health", to: "health#check"
  get "/deep_health", to: "deep_health#check"
  get "/deep_health_test_success", to: "deep_health#check_test_success"
  get "/deep_health_test_fail", to: "deep_health#check_test_fail"

  # Frontend
  get "/guests", to: "guests#list"
  get "/guests_test", to: "guests#list_test"

  # Backend
  get "/guest_from_db", to: "guests_from_db#guests_from_db"

end
