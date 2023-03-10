# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :category, only: %i[show edit update destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: 'Category was created'
    else
      redirect_to root_url, alert: @category.errors.full_messages.join(', ')
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: 'Category was updated'
    else
      redirect_to :index, alert: @category.errors.full_messages.join(', ')
    end
  end

  def destroy
    if @category.destroy
      redirect_to :index, notice: 'Category was destroyed'
    else
      redirect_to :index, alert: @category.errors.full_messages.join(', ')
    end
  end

  def show; end

  def edit; end

  private

  def category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
