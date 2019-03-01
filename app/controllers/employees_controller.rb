class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :delete]
  before_action :employee_params, only: [:create, :update]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    redirect_to @employee
  end

  def update
    @employee = set_employee.update(employee_params)
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :office, :alias, :img_url, :title, :dog_id)
  end


end
