class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def show
    @cat = Cat.find_by_id(params[:id])
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @cat.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
  end

  def update
    @cat = Cat.find_by_id(params[:id])

    if @cat.update(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] ||= []
      flash.now[:errors] << @cat.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @cat = Cat.find_by_id(params[:id])

    unless @cat.destroy
      flash.now[:errors] ||= []
      flash.now[:errors] << @cat.errors.full_messages.to_sentence
    end
    render :show
  end


  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :sex, :name, :description)
  end

end
