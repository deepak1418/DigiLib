class HomeController < ApplicationController
  before_action :authenticate_user!
  def index

  end

  def pdf
    @subjects=Document.all
  end
  def topic_wise_list
    @sub=Document.where(:subject=>params[:id])
  end

  def video
    @subjects=Document.all
  end

  def topic_wise_video_list
    @sub=Document.where(:subject=>params[:id])

  end
  def all_list
    @sub=Document.where(:subject=>params[:id])
  end

  def doc
    @subjects=Document.all
  end

  def topic_wise_doc_list
    @sub=Document.where(:subject=>params[:id])

  end


  end
