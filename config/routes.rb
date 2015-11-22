TechRadar::Engine.routes.draw do
  get 'radar/index'
  get 'radar/summary'
  resources :technologies, only: [ :index, :show ]
  resources :quadrants, only: [ :show ]
  resources :rings, only: [ :show ]

end
