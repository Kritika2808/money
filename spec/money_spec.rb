require 'spec_helper'

describe Money do

  context "for the addition of two money values (2 Rs 30 paise and 2 Rs 30 paise)" do

    it "returns sum of 4 RS 60 paise" do
      money1=Money.new(2, 30)
      money2=Money.new(2, 30)
      sum=Money.new(4, 60)
      expect(money1 + money2).to eq(sum)
    end

  end

  context "for the subtraction of two money values (2 Rs 30 paise and 4 Rs 60 paise)" do

    it "returns sum of 2 RS 30 paise" do
      money1=Money.new(2, 30)
      money2=Money.new(4, 60)
      difference=Money.new(-2, -30)
      expect(money1 - money2).to eq(difference)
    end

  end

  context "text format of money" do

    it "prints 2 Rs. 30 p for Money(2,30)" do
      money = Money.new(2, 30)
      expect(money.to_s).to eq("2 Rs. 30 p")
    end

  end

  context "comparator operation" do

    let(:money1) {Money.new(1, 0)}
    let(:money2) {Money.new(2, 0)}

    it "return 0 for =" do
      expect(money1 <=> money1).to eq(0)
    end

    it "return -1 for <" do
      expect(money1 <=> money2).to eq(-1)
    end

    it "return 1 for >" do
      expect(money2 <=> money1).to eq(1)
    end

    it "return nil for different type" do
      expect(money1 <=> Object.new).to eq(nil)
    end

  end

  context "sorting" do

    it "should sort" do
      money1 = Money.new(1, 0)
      money2 = Money.new(2, 0)
      money3 = Money.new(3, 0)
      initial_order = [money1, money3, money2]
      expected_order = [money1, money2, money3]
      expect(initial_order.sort).to eq(expected_order)
    end

  end

  context "compare" do

    it "returns true for <" do
      money1 = Money.new(1, 5)
      money2 = Money.new(2, 6)
      expect(money1 < money2).to eq(true)
    end

    it "returns true for >" do
      money1 = Money.new(2, 6)
      money2 = Money.new(1, 5)
      expect(money1 > money2).to eq(true)
    end

  end


  context "equality" do

    it "should be equal if the object is identical (or same)" do
      money = Money.new(1, 2)
      expect(money).to eq(money)
    end

    it "should not be equal for different type" do
      money1=Money.new(2, 3)
      object = Array.new(1)
      expect(money1).to_not eq(object)
    end

    it "should not be equal to nil" do
      money1=Money.new(2, 3)
      expect(money1).to_not eq(nil)
    end

    it "should be equal if the values are equal" do
      money1=Money.new(2, 3)
      money2=Money.new(2, 3)
      expect(money1).to eq(money2)
    end

    it "should point to the same value if two money amounts are same" do
      money1=Money.new(2, 3)
      money2=Money.new(2, 3)
      value = "hello"
      h = {money1 => value}
      expect(h[money2]).to eq(value)
    end

    it "supports symmetry" do
      money1 = Money.new(2, 3)
      money2 = Money.new(2, 3)
      expect(money1).to eq(money2) and expect(money2).to eq(money1)
    end

    it "supports transitivity" do
      money1 = Money.new(2, 3)
      money2 = Money.new(2, 3)
      money3 = Money.new(2, 3)
      expect(money1).to eq(money2) and expect(money2).to eq(money3) and expect(money3).to eq(money1)
    end

  end
end


