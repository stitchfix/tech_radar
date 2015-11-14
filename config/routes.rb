TechRadar::Engine.routes.draw do
  get 'radar/index'
  get 'radar/graph'
  resources :technologies, only: [ :index, :show ]
  resources :quadrants, only: [ :show ]

end
