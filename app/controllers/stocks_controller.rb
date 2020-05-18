class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                respond_to do |format|
                    format.js {render partial: 'users/results'}
                end
            else
                respond_to do |format|
                    flash.now[:alert] = "Enter valid symbol"
                    format.js {render partial: 'users/results'}
                end
            end
        else
            respond_to do |format|
                flash[:alert] = "Enter a symbol to search"
                format.js {render partial: 'users/results'}
            end
        end
    end
end