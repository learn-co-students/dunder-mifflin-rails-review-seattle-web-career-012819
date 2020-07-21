class EmployeesController < ApplicationController
    def index
        @employees = Employee.all 
    end

    def show 
        @employee = Employee.find(params[:id])
    end 

    def new 
        @employee = Employee.new
        @dogs = Dog.all
    end 

    def create 
        @employee = Employee.create(employee_params)
        redirect_to employees_path(@employee)
    end 

    def edit 
        @employee = Employee.find(params[:id])
    end 

    def update 
        @employee = Employee.update(employee_params)
        redirect_to employees_path(@employee)
    end 

    private 
    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
    end
end
