require "tdd"
require "spec_helper"

describe "#uniq" do
    let (:arr) { [1,1,2,2,3,4] }
    it "removes duplicates from array" do
        expect(uniq(arr)).to eq([1,2,3,4])
    end
end

describe "#two_sum" do
    let (:arr) { [-3,3,1,4] }
    
    it "finds pairs that sum = 0" do
        expect(two_sum(arr)).to eq([[0,1]])
    end

    it "result goes from lower index to higher index" do
        expect(two_sum(arr)).not_to eq([[1,0]])
    end

end

describe "#my_transpose" do
    let (:matrix) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    it "should return transpose of matrix" do
        expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
    end
end
