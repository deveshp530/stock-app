class StocksController < ApplicationController
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock])
            if @stock
                render 'users/portfolio'
            else
                flash[:alert] = "Enter valid symbol"
                redirect_to portfolio_path
            end
        else
            flash[:alert] = "Enter a symbol to search"
            redirect_to portfolio_path
        end
    end
end