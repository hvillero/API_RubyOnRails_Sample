Api::Application.routes.draw do
    namespace :api do
       resources :pages do
         collection do
             get 'published'
             get 'unpublished'
         end
         member do
           post 'publish'
           get 'total_words'
         end
       end
     end



end
