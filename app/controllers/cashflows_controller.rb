class CashflowsController < ApplicationController
  # GET /cashflows
  # GET /cashflows.xml
  def index
    @cashflows = Cashflow.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @cashflows }
    end
  end

  # GET /cashflows/1
  # GET /cashflows/1.xml
  def show
    @cashflow = Cashflow.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cashflow }
    end
  end

  # GET /cashflows/new
  # GET /cashflows/new.xml
  def new
    @cashflow = Cashflow.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cashflow }
    end
  end

  # GET /cashflows/1/edit
  def edit
    @cashflow = Cashflow.find(params[:id])
  end

  # POST /cashflows
  # POST /cashflows.xml
  def create
    @cashflow = Cashflow.new(params[:cashflow])

    respond_to do |format|
      if @cashflow.save
        format.html { redirect_to(@cashflow, :notice => 'Cashflow was successfully created.') }
        format.xml  { render :xml => @cashflow, :status => :created, :location => @cashflow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cashflow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cashflows/1
  # PUT /cashflows/1.xml
  def update
    @cashflow = Cashflow.find(params[:id])

    respond_to do |format|
      if @cashflow.update_attributes(params[:cashflow])
        format.html { redirect_to(@cashflow, :notice => 'Cashflow was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cashflow.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cashflows/1
  # DELETE /cashflows/1.xml
  def destroy
    @cashflow = Cashflow.find(params[:id])
    @cashflow.destroy

    respond_to do |format|
      format.html { redirect_to(cashflows_url) }
      format.xml  { head :ok }
    end
  end
end
