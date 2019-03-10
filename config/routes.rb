Rails.application.routes.draw do
  resources :topics
  resources :documents
  devise_for :users
  root :to=>"home#index"
  # get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/all_pdf' ,:action=>"pdf",:controller=>"home",:as =>"all_pdf"
  get '/topic_wise_list/:id',:action=>"topic_wise_list",:controller=>"home",:as =>"topic_wise_list"
  get '/video',:action=>"video",:controller=>"home",:as=>"video"
  get '/topic_wise_video_list/:id',:action=>"topic_wise_video_list",:controller=>"home",:as=>"topic_wise_video_list"
  get '/all_list/:id',:action=>"all_list",:controller=>"home",:as=>"all_list"
  get '/doc',:action=>"doc",:controller=>"home",:as=>"doc"
  get '/topic_wise_doc_list/:id',:action=>"topic_wise_doc_list",:controller=>"home",:as=>"topic_wise_doc_list"






end
