module Api
    module V1
        class UsersController < ApplicationController

            def index
                users = User.all
                render json: users.to_json
            end

            def test
                # user = User.find_by(params[:id])
                # figure out how to do this dynamically
                user = User.find_by(id: 3)
                render json: {blah: user.test}
            end

            def holesPlayed
                user = User.find_by(id: 1)
                render json: {holeTotal: user.holesPlayed}
            end
        
            def show
                user = User.find(params[:id])
                render json: user.to_json(:include => {
                    :scorecards => {:only => [:id, :f9_par, :f9_score, :b9_par, :b9_score, :created_at, :course]}
                }, except: [:updated_at])
            end
        
        end
    end
end

