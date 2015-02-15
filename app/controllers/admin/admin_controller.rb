module Admin
  class AdminController < ApplicationController
    before_action :set_item, only: [:edit, :update, :destroy]

    respond_to :html

    def index
      # items = model.all
      instance_variable_set "@#{ model_name_plural }", model.all
    end

    def new
      # item = model.new
      instance_variable_set "@#{ model_name }", model.new
    end

    def edit
    end

    def create
      # item = model.new send("#{ model_name }_params")
      instance_variable_set "@#{ model_name }", model.new(valid_params)
      flash[:notice] = "#{ model_name.capitalize } was successfully created." if item.save
      respond_with item , location: send("admin_#{ model_name_plural }_path")
    end

    def update
      flash[:notice] = "#{ model_name.capitalize } was successfully updated." if item.update(valid_params)
      respond_with item , location: send("admin_#{ model_name_plural }_path")
    end

    def destroy
      item.destroy
      flash[:notice] = "#{ model_name.capitalize } was successfully destroyed."
      respond_with(:admin, item )
    end

    private

    def model_name_plural
      @model_name_plural ||= self.class.controller_name
    end

    def model_name
      @model_name ||= model_name_plural.singularize
    end

    def model
      @model ||= model_name.capitalize.constantize
    end

    def item
      instance_variable_get "@#{ model_name }"
    end

    # def item=(attr)
    #   instance_variable_set "@#{ model_name }", attr
    # end

    def items
      instance_variable_get "@#{ model_name_plural }"
    end

    # def items=(attr)
    #   instance_variable_set "@#{ model_name_plural }", attr
    # end

    def set_item
      # item = model.find(params[:id])
      instance_variable_set "@#{ model_name }", model.find(params[:id])
    end

    def valid_params
      send("#{ model_name }_params")
    end
  end
end
