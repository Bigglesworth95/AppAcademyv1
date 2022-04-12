require 'problems'
#require 'byebug'

describe "#my_uniq" do
  it "returns the unique elements in the ordr in which they first appeared" do
    arr = [1, 2, 1, 3, 3]
    expect(my_uniq(arr)).to eq([1,2,3])
  end

  it 'only contains elements from the og array' do
    arr = [1, 2, 1, 3, 3]
    my_uniq(arr).each do |el|
      expect(arr).to include(el)
    end
  end
end

describe "#two_sum" do
  let (:array) {[-1, 0, 2, -2, 1]}
  let (:two_zeros) {[0,1,-1,0]}

  it 'finds all pairs of positions where the elements at those positions sum to 0' do
    expect(two_sum(array)).to eq([[0,4], [2,3]])
  end

  it 'can handle two 0s'do
    expect(two_sum(two_zeros)).to eq([[0, 3], [1, 2]])
  end
end

describe "#my_transpose" do
  let (:matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ]}

  it 'transposes rows to columns' do
    expect(my_transpose(matrix)).to eq([
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ])
  end

  it 'transposes columns to rows' do
    arr = my_transpose(matrix)
    arr = my_transpose(arr)
    expect(arr).to eq(matrix)
  end
end

describe "#stock_picker" do
  let (:stocks) {[3, 4, 2, 5, 1, 3, 9, 0]}

  it 'finds most profitable pair'do
    expect(stock_picker(stocks)).to eq([1, 9])
  end

  it 'does not sell stock before it is purchased' do
    expect(stock_picker(stocks)).to_not eq([9,0])
  end
end


describe Tower_of_hanoi do
  subject(:game) {Tower_of_hanoi.new}
  let(:towers) {game.towers}

  describe "#won?" do
    it "returns true when the last tower is full" do
      expect(game.won).to eq(true) if game.towers[-1].length == 3
    end
  end

  describe "#move" do
    it "allows moving to a blank space" do
      expect {game.move([0,1])}.not_to raise_error
    end

    it "allows moving to a space with a smaller piece" do
      game.move([0,2])
      game.move([0,1])
      expect {game.move([2, 1])}.not_to raise_error
    end

    it "does not allow moving onto a smaller disk" do
      game.move([0,1])
      expect {game.move([0,1])}.to raise_error("cannot move onto smaller disk")
    end
  end

end
