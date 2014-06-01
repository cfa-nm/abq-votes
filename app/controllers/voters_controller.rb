class VotersController < ApplicationController
  respond_to :html

  def new
    @voter = Voter.new
    respond_with @voter
  end

  def create
    @voter = Voter.create voter_params
    respond_with @voter do |format|
      format.html do
        if @voter.persisted?
          render :create
        else
          render :new
        end
      end
    end
  end

  private

  def voter_params
    params.require(:voter)
      .permit :name, :email, :address, :zip, :birthday
  end
end
