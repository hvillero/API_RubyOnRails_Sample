Api::Application.routes.draw do
  scope :path => 'api' do
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
