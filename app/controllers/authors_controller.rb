require_dependency 'weather_service'
require 'will_paginate/array'

class AuthorsController < ApplicationController

  after_action :send_email, only: :create

  def index
    @authors = Author.paginate(:page => params[:page], :per_page => 1)
    #@authors = Author.all
  end

  def show
    @author = Author.friendly.find(params[:id])
    # weather_service = WeatherService.new(@author.city)
    # @weather_data = weather_service.call
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      cookies.encrypted[:name] = @author.name
      cookies[:city] = @author.city
      session[:name] = @author.name
      session[:city] = @author.city
      redirect_to @author
    else
      render :new, status: 404
    end
  end

  def destroy
    @author = Author.friendly.find(params[:id])
    cookies.delete(:name)
    cookies.delete(:city)
    session.delete(:name)
    session.delete(:city)
    @author.destroy
    redirect_to @author
  end

  def current_user
    current_student
  end

  private

  def author_params
    params.require(:author).permit(:name, :city, :avatar)
  end

  def send_email
    # Resque.enqueue(AuthorJob, @author)
    # AuthorJob.perform_later(@author)
     VisitorMailer.welcome_email(@author.name, @author.city).deliver_now
  end
end