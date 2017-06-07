require 'TDD_Practice'
require 'rspec'

describe Array do
  subject { Array.new }

  describe "#remove_dupes" do
    subject(:case_one) {[1,2,1,3,3]}

    it "returns an array" do
      expect(subject.remove_dupes).to be_an_instance_of(Array)
    end

    it "removes duplicates from self" do
      expect(case_one.remove_dupes).to eq(case_one.uniq)
    end

    it "does not modify the original array" do
      case_dup = case_one.dup
      case_one.remove_dupes
      expect(case_one).to eq(case_dup)
    end
  end

  describe "#two_sum" do
    subject(:sum_case) {[-1, 0, 2, -2, 1]}

    it "returns an array" do
      expect(subject.two_sum).to be_an_instance_of(Array)
    end

    it "does not modify the original array" do
      case_dup = sum_case.dup
      sum_case.two_sum
      expect(sum_case).to eq(case_dup)
    end

    it "finds all pairs of positions where elements sum to zero" do
      expect(sum_case.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe "#my_transpose" do
    subject(:transpose_case) {[[0, 1, 2], [3, 4, 5], [6, 7, 8]]}

    it "returns an array of arrays" do
      expect(transpose_case.my_transpose.all? {|arr| arr.is_a?(Array)}).to eq(true)
    end

    it "does not modify the original array" do
      case_dup = transpose_case.dup
      transpose_case.my_transpose
      expect(transpose_case).to eq(case_dup)
    end

    it "transposes the matrix" do
      expect(transpose_case.my_transpose).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
  end

  describe "#stock_picker" do
    subject(:stock_case) {[1,4,12,9,7,18,1]}

    it "returns an array" do
      expect(stock_case.stock_picker).to be_an_instance_of(Array)
    end

    it "returns length 2" do
      expect(stock_case.stock_picker.length).to eq(2)
    end

    it "returns correct pair" do
      expect(stock_case.stock_picker).to eq([0,5])
    end

  end

end
