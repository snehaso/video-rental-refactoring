class Customer
  def initialize name
    @name = name
    @rental_list = []
  end

  def add_rental(arg)
    @rental_list << arg
  end

  def get_name()
    @name
  end

  def statement
    total_amount = 0.0
    frequent_renter_points = 0
    result = "Rental Record for #{get_name}\n"
    @rental_list.each do |rental|
      #determine amount for each rental
      this_amount = 0.0
      case (rental.get_movie.get_price_code)
      when Movie::REGULAR
        this_amount +=2
        if (rental.get_days_rented > 2)
          this_amount += (rental.get_days_rented - 2) * 1.5;
        end
      when Movie::NEW_RELEASE
        this_amount += rental.get_days_rented * 3;
      when Movie::CHILDREN
        this_amount += 1.5;
        if (rental.get_days_rented() > 3)
          this_amount += (rental.get_days_rented - 3) * 1.5;
        end
      end

      # add frequent renter points
      frequent_renter_points += 1

      if((rental.get_movie.get_price_code == Movie::NEW_RELEASE) && rental.get_days_rented > 1)
        frequent_renter_points += 1
      end
        #show figures for this rental
      result += "\t#{rental.get_movie.get_title}\t#{this_amount}\n"
      total_amount += this_amount


      #add bonus for a two day new release rental

    end
    #add footer lines
    result += "Amount owed is #{total_amount}\n"
    result += "You earned #{frequent_renter_points} frequent renter points\n"

    result
  end
end

