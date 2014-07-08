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
      expect(money1).to eq(money2)
      expect(money2).to eq(money1)
    end

    it "supports transitivity" do
      money1 = Money.new(2, 3)
      money2 = Money.new(2, 3)
      money3 = Money.new(2, 3)
      expect(money1).to eq(money2)
      expect(money2).to eq(money3)
      expect(money3).to eq(money1)
    end

  end
end


