module Api
    module V1

        class ScorecardsController < ApplicationController

            def index
                scorecards = Scorecard.all
                render json: scorecards.to_json
            end

            def show
                scorecard = Scorecard.find(params[:id])
                # render json: scorecard.to_json(include: methods: [:test])
                render json: scorecard.to_json
            end

            def new
                Scorecard.new
            end

            def create
                scorecard = Scorecard.create(scorecard_params)
                # scorecard = Scorecard.create(scorecard_params :user_id user_id)
                render json: scorecard.to_json
            end

            def update
                scorecard = Scorecard.find(params[:id])
                # if scorecard.user_id !== user_id
                #     raise "You do not have access"
                # end
                scorecard.update(scorecard_params)
                render json: scorecard.to_json
            end

            def destroy
                scorecard = Scorecard.find(params[:id])
                # if scorecard.user_id !== user_id
                #     raise "You do not have access"
                # end
                scorecard.destroy
                render json: {message: "Scorecard deleted"}
            end

            private
            # need to figure out a better solution for this
                def scorecard_params
                    params.require(:scorecard).permit!
                end

        end
    end
end
