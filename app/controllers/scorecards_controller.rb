class ScorecardsController < ApplicationController

    def index
        scorecards = Scorecard.all
        render json: scorecards.to_json
    end

    def show
        scorecard = Scorecard.find(params[:id])
        render json: scorecard.to_json
    end

end
