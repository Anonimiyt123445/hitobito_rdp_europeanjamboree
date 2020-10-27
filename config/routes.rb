# encoding: utf-8

#  Copyright (c) 2012-2020, European Jamboree Contingent of Ringe deutscher Pfadfinderinnen- und Pfadfinderverbände e.V.. This file is part of
#  hitobito_rdp_europeanjamboree and licensed under the Affero General Public License version 3
#  or later. See the COPYING file at the top-level directory or at
#  https://github.com/smeky42/hitobito_rdp_europeanjamboree.


Rails.application.routes.draw do

  extend LanguageRouteScope

  language_scope do
    # Define wagon routes here

    get '/registration', to: "registration#index"
    post '/registration', to: "registration#index"
    put '/registration', to: "registration#index"
    get '/map' => 'map#index', as: :map

    resources :groups do
      resources :people, except: [:new, :create] do
        member do
          post :send_password_instructions
          put :primary_group

          get 'payment' => 'person/payment#index'
          put 'payment' => 'person/payment#index'
          get 'payment/edit' => 'person/payment#edit'
          put 'payment/edit' => 'person/payment#edit'

          get 'print' => 'person/print#index'
          put 'print' => 'person/print#index'
          get 'print/preview' => 'person/print#preview'
          get 'print/submit' => 'person/print#submit'

          get 'management' => 'person/management#index'
          put 'management' => 'person/management#index'
          get 'management/edit' => 'person/management#edit'
          put 'management/edit' => 'person/management#edit'
        end 
      end 
    end
  end
end
