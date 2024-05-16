# frozen_string_literal: true

class SurveysController < ApplicationController
  def index
    @surveys = Survey.includes(:question).all.decorate
  end

  def show
    @survey = Survey.find(params[:id]).decorate
  end
end
