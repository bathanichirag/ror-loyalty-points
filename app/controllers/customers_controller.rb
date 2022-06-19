class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @customers = Customer.select(:id,:name,:birth_date).all
  end

  def show
    @customer = Customer.find(params[:id])
    customer_created_date = @customer.created_at.strftime("%Y-%m-%d")
    puts customer_created_date
    birth_month = @customer.birth_date.month
    current_year = Time.now.year
    current_month = Time.now.month

    @result = Hash.new
    customer_id = params[:id]
    prev_year = current_year - 1


    sql = "SELECT MONTH(transaction_date) as month, SUM(amount) as total_sum,"
    sql += "SUM(CASE WHEN(currency_code != 'USD') THEN amount ELSE 0 END) as other_currency_sum, "
    sql += "SUM(CASE WHEN(amount > 100) THEN (1) ELSE 0 END) as transaction_cnt "
    sql += " FROM transactions where customer_id = '#{customer_id}' and YEAR(transaction_date) = '#{current_year}' GROUP BY MONTH(transaction_date) "
    customer_transactions = Transaction.find_by_sql(sql)

    prevyearsql = "SELECT SUM(amount) as total_sum, SUM(CASE WHEN(currency_code != 'USD') THEN amount ELSE 0 END) as other_currency_sum"
    prevyearsql += " FROM transactions where customer_id = '#{customer_id}' and YEAR(transaction_date) = '#{prev_year}' GROUP BY YEAR(transaction_date) "
		prev_year_transactions = Transaction.find_by_sql(prevyearsql).first

		puts 'TOTAL: #{prev_year_transactions}'
    start_date = customer_created_date
    end_date = customer_created_date.to_date + 60.days

    newusersql = "SELECT SUM(CASE WHEN(amount > 1000) THEN (1) ELSE 0 END) as total FROM transactions WHERE transaction_date BETWEEN '#{start_date}' AND '#{end_date}'"
		newuser_transactions = Transaction.find_by_sql(newusersql).first

		total_points = 0
		total_amount = 0
		first_quarter_sum = 0
		second_quarter_sum = 0
		third_quarter_sum = 0
		fourth_quarter_sum = 0
		tier_points = 0
		month_wise_rewards = {}
		other_rewards = []
		total_other_amount = 0
		customer_transactions.each do |tran|
			temp = []
			month_total_amount = tran.total_sum + tran.other_currency_sum
			month_total_point = ((tran.total_sum > 0 ) ? ((tran.total_sum / 100).to_i * 10).to_i : 0) + ((tran.other_currency_sum > 0 ) ? ((tran.other_currency_sum / 100).to_i * 10).to_i : 0)

			if month_total_point >= 100
				temp.push("Free Coffee reward")
			end
			if tran.transaction_cnt >= 10
				temp.push("5% Cash Rebate reward")
			end
			if temp.count > 0
	      month_wise_rewards[tran.month] = temp
	    end

	    if (1..3).include?(tran.month)
				first_quarter_sum += tran.total_sum
			elsif	(4..6).include?(tran.month)
				second_quarter_sum += tran.total_sum
			elsif	(7..9).include?(tran.month)
				third_quarter_sum += tran.total_sum
			elsif	(10..12).include?(tran.month)
				fourth_quarter_sum += tran.total_sum
	    end

	    total_amount += tran.total_sum
	    total_other_amount += tran.other_currency_sum
    end

    if birth_month <= current_month
      month_wise_rewards[birth_month] = ['Free Coffee reward']
    end

    if newuser_transactions.total.present? && newuser_transactions.total > 0
      other_rewards.push("Free Movie Tickets reward")
    end

    total_points = ((total_amount > 0 ) ? ((total_amount / 100).to_i * 10).to_i : 0) + ((total_other_amount > 0 ) ? ((total_other_amount / 100).to_i * 10).to_i : 0)

    if(first_quarter_sum > 2000)
      total_points += 100
    end
    if(second_quarter_sum > 2000)
      total_points += 100
    end
    if(third_quarter_sum > 2000)
      total_points += 100
    end
    if(fourth_quarter_sum > 2000)
      total_points += 100
    end

    tier_points = total_points

    if prev_year_transactions.present?
      prevyear_total_amount = prev_year_transactions.total_sum + prev_year_transactions.other_currency_sum
      prevyear_total_point = (prevyear_total_amount > 0 ) ? ((prevyear_total_amount / 100).to_i * 10).to_i : 0

      if(tier_points < prevyear_total_point)
        tier_points = prevyear_total_point
      end
    end

    if(tier_points < 1000)
      @result['customer_tier'] = "Standard"
    elsif	(tier_points >= 1000 && tier_points < 5000)
      @result['customer_tier'] = "Gold"
      other_rewards.push("4x Airport Lounge Access Reward")
    elsif	(tier_points >= 5000)
      @result['customer_tier'] = "Platinum"
      other_rewards.push("4x Airport Lounge Access Reward")
    end
#     puts "customer_created_date #{customer_created_date}"
#     puts "rewards #{rewards}"
# 		puts "total_amount #{total_amount}"
# 		puts "total_points #{total_points}"

		@result['customer'] = @customer
		@result['total_points'] = total_points
		@result['rewards'] = month_wise_rewards
		@result['other_rewards'] = other_rewards
  end

  def new
    @customer = Customer.new
  end

  def create
      @customer = Customer.new(customer_params)
      if @customer.save
        flash[:notice] = 'Customer added!'
        redirect_to customers_path
      else
        flash[:error] = 'Failed to edit Customer!'
        render :new
      end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update_attributes(customer_params)
      flash[:notice] = 'Customer updated!'
      redirect_to customers_path
    else
      flash[:error] = 'Failed to edit Customer!'
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer.delete
      flash[:notice] = 'Customer deleted!'
      redirect_to customers_path
    else
      flash[:error] = 'Failed to delete this Customer!'
      render :destroy
    end
  end

  def customer_params
     params.require(:customer).permit(:name, :birth_date)
  end
end
