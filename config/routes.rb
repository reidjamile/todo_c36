# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tasks#index'
  resources :tasks, only: [:create, :destroy]
end
