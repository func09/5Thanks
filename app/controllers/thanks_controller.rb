# -*- encoding: utf-8 -*-
class ThanksController < ApplicationController
  before_filter :authenticate_user!
  # GET /thanks
  # GET /thanks.json
  def index
    if params[:m]
      @month = Date.parse(params[:m].concat('-01')).beginning_of_month if params[:m]
    else
      @month = Date.today.beginning_of_month
    end
    # メモした月リストを作成
    @months = current_user.thanks.group(:date_at).count
                .keys.group_by{|key,value| key.strftime('%Y-%m') }.keys.map{|d| Date.parse("#{d}-01") }.sort.reverse
    @thanks =  current_user.thanks
                 .where(:date_at => (@month.beginning_of_month)..(@month.end_of_month))
                 .order('date_at DESC')
                 .group_by{|t| t.date_at}

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /thanks/1
  # GET /thanks/1.json
  def show
    @thank = Thank.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @thank }
    end
  end

  # GET /thanks/new
  # GET /thanks/new.json
  def new
    date = Date.today
    if params[:date]
      date = DateTime.parse(params[:date])
    end
    
    @thank = Thank.new :date_at => date

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @thank }
    end
  end

  # GET /thanks/1/edit
  def edit
    @thank = Thank.find(params[:id])
  end

  # POST /thanks
  # POST /thanks.json
  def create
    @thank = current_user.thanks.build(params[:thank])

    respond_to do |format|
      if @thank.save
        format.html { redirect_to thanks_path, notice: '感謝の気持ちが増えました！' }
        format.json { render json: @thank, status: :created, location: @thank }
      else
        format.html { render action: "new" }
        format.json { render json: @thank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /thanks/1
  # PUT /thanks/1.json
  def update
    @thank = Thank.find(params[:id])

    respond_to do |format|
      if @thank.update_attributes(params[:thank])
        format.html { redirect_to @thank, notice: 'Thank was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @thank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thanks/1
  # DELETE /thanks/1.json
  def destroy
    @thank = Thank.find(params[:id])
    @thank.destroy

    respond_to do |format|
      format.html { redirect_to thanks_url }
      format.json { head :ok }
    end
  end
end
