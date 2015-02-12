class Movie
  CHILDREN = 2;
  REGULAR = 0;
  NEW_RELEASE = 1;

  def initialize(title, price_code)
    @title = title
    @price_code = price_code
  end

  def get_price_code
    @price_code
  end

  def set_price_code code
    @price_code = code
  end

  def get_title
    @title
  end
end
