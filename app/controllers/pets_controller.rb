class PetsController < ApplicationController

    def index
        @pets = Pet.all
    end

    def show
        @pets = Pet.find(params[:id])
    end

    def new
        @pets = Pet.new
    end

    def create
        @pets = Pet.new(pet_params)
        @pets.save
        redirect_to "/pets"
    end

    def edit
        @pets = Pet.find(params[:id])
    end

    def update
        @pets = Pets.find(params[:id])
        if @pets.update(pets_params)
            redirect_to "/pets"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def pet_params
        params.require(:name, :breed, :image)
    end
end
