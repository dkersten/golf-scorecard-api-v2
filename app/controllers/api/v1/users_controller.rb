module Api
    module V1
        class UsersController < ApplicationController
            include Secured

            def index
                users = User.all
                render json: users.to_json
            end

            # def test
            #     # user = User.find_by(params[:id])
            #     # figure out how to do this dynamically
            #     user = User.find_by(id: 3)
            #     render json: {blah: user.test}
            # end

            # def holesPlayed
            #     user = User.find(params[:id])
            #     render json: {holeTotal: user.holesPlayed}
            # end
        
            def me
                user = User.find(user_id)
                render json: user.to_json(:include => {
                    :scorecards => {:only => [:id, :f9_par, :f9_score, :b9_par, :b9_score, :created_at, :course, :holes, :eagles, :birdies, :pars, :bogeys, :other_scores]}
                }, except: [:updated_at])
            end

        end
    end
end

