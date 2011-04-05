class AssertAccountsController < ApplicationController
  # GET /assert_accounts
  # GET /assert_accounts.xml
  def index
    @assert_accounts = AssertAccount.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @assert_accounts }
    end
  end

  # GET /assert_accounts/1
  # GET /assert_accounts/1.xml
  def show
    @assert_account = AssertAccount.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @assert_account }
    end
  end

  # GET /assert_accounts/new
  # GET /assert_accounts/new.xml
  def new
    @assert_account = AssertAccount.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @assert_account }
    end
  end

  # GET /assert_accounts/1/edit
  def edit
    @assert_account = AssertAccount.find(params[:id])
  end

  # POST /assert_accounts
  # POST /assert_accounts.xml
  def create
    @assert_account = AssertAccount.new(params[:assert_account])

    respond_to do |format|
      if @assert_account.save
        format.html { redirect_to(@assert_account, :notice => 'Assert account was successfully created.') }
        format.xml  { render :xml => @assert_account, :status => :created, :location => @assert_account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @assert_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /assert_accounts/1
  # PUT /assert_accounts/1.xml
  def update
    @assert_account = AssertAccount.find(params[:id])

    respond_to do |format|
      if @assert_account.update_attributes(params[:assert_account])
        format.html { redirect_to(@assert_account, :notice => 'Assert account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @assert_account.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /assert_accounts/1
  # DELETE /assert_accounts/1.xml
  def destroy
    @assert_account = AssertAccount.find(params[:id])
    @assert_account.destroy

    respond_to do |format|
      format.html { redirect_to(assert_accounts_url) }
      format.xml  { head :ok }
    end
  end
end
