class RecipesController < ApplicationController
  redirect_if_not_logged_in
end
