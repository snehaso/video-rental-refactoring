require 'spec_helper'
describe Customer do
  GOLD_PATH = 'data'

  # @return [Object]
  before(:each) do
    @dins_dale = Customer.new('Dinsdale Pirhana')
    @python = Movie.new('Monty Python and the Holy Grail', Movie::REGULAR)
    @ran = Movie.new('Ran', Movie::REGULAR);
    @la = Movie.new('LA Confidential', Movie::NEW_RELEASE);
    @trek = Movie.new('Star Trek 13.2', Movie::NEW_RELEASE);
    @wallace = Movie.new('Wallace and Gromit', Movie::CHILDREN);

    @dins_dale.add_rental(Rental.new(@python, 3))
    @dins_dale.add_rental(Rental.new(@ran, 1))
    @dins_dale.add_rental(Rental.new(@la, 2))
    @dins_dale.add_rental(Rental.new(@trek, 1))
    @dins_dale.add_rental(Rental.new(@wallace, 6))
  end

  it 'should output empty statement' do
    customer = Customer.new('Golden Shark')
    verify_output(customer.statement, 'outputEmpty')
  end

  it 'should output customer statement statement' do
    verify_output(@dins_dale.statement, 'output1')
  end

  it 'should output changed statement' do
    @la.set_price_code(Movie::REGULAR)
    verify_output(@dins_dale.statement, 'outputChange')
  end

  def verify_output(actual_value, file_name)
    f = File.open("#{File.expand_path(GOLD_PATH, File.dirname(__FILE__))}/#{file_name}")
    expected_contents = f.read
    f.close
    expect(actual_value).to eq(expected_contents)
  end

end

