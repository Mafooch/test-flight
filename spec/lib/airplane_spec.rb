require 'pry'
require_relative "../../lib/airplane"

new_plane = Airplane.new("lear", 100, 300)
describe Airplane do
  let(:lear_jet) { Airplane.new("lear", 100, 300) }

  describe "#initialize" do
    it "returns cesna for type" do
      expect(lear_jet.type).to eq("lear")
    end
    it "returns 10 for wingloading" do
      expect(lear_jet.wing_loading).to eq(100)
    end
    it "returns 150 for horsepower" do
      expect(lear_jet.horsepower).to eq(300)
    end
    it "returns false for @started" do
      expect(lear_jet.started).to eq(false)
    end
    it "returns false for @flying" do
      expect(lear_jet.flying).to eq(false)
    end
    it "returns 5 for @fuel" do
      expect(lear_jet.fuel).to eq(5)
    end
  end

  describe "#land" do
    context "When airplane not has not been started" do
      it "returns 'airplane not started, please start'" do
        expect(lear_jet.land).to eq "airplane not started, please start"
      end
    end

    context "When airplane has been started but hasn't taken off" do
      it "returns 'airplane already on the ground'" do
        lear_jet.start
        expect(lear_jet.land).to eq "airplane already on the ground"
      end
    end

    context "If plane is flying" do
      it "returns 'airplane landed'" do
        lear_jet.start
        lear_jet.takeoff
        expect(lear_jet.land).to eq "airplane landed"
      end
    end

  end

  describe "#takeoff" do
    context "When plane hasn't been started yet" do
      it "returns 'airplane not started, please start'" do
        expect(lear_jet.takeoff).to eq "airplane not started, please start"
      end
      it "@flying will be false" do
        expect(lear_jet.flying).to eq false
      end
    end

    context "When the plane has been started." do
      it "returns 'airplane launched'" do
        lear_jet.start
        expect(lear_jet.takeoff).to eq "airplane launched"
      end
      it "@flying will be true" do
        lear_jet.start
        lear_jet.takeoff
        expect(lear_jet.flying).to eq true
      end
    end
  end

  describe "#start" do
    context "when the plane hasn't been started yet" do
      it "@started will be false" do
        expect(lear_jet.started).to eq false
      end
      it "when started returns 'airplane started'" do
        expect(lear_jet.start).to eq "airplane started"
      end
    end

    context "when the plane has already been started" do
      it "@started will be flipped to true" do
        lear_jet.start
        expect(lear_jet.started).to eq true
      end
      it "returns 'airplane already started'" do
        lear_jet.start
        expect(lear_jet.start).to eq 'airplane already started'
      end
    end
  end

  describe "#not_enough_fuel"
    let(:low_fuel_airplane) do
      new_plane.instance_variable_set(:@fuel, 1)
      new_plane
    end

    context "when fuel to low to start" do
      it "when started returns 'You don't have enough fuel!'" do
        low_fuel_airplane
        expect(low_fuel_airplane.start).to eq "You don't have enough fuel!"
      end
    end

    context "started but fuel to low to takeoff" do
      it "when takeoff returns 'You don't have enough fuel!'" do
        low_fuel_airplane.instance_variable_set(:@started, true)
        expect(low_fuel_airplane.takeoff).to eq "You don't have enough fuel!"
      end
    end

    context "flying but not enough fuel to land" do
      it "when started returns 'You don't have enough fuel!'" do
        low_fuel_airplane.instance_variable_set(:@started, true)
        low_fuel_airplane.instance_variable_set(:@flying, true)
        expect(low_fuel_airplane.land).to eq "You don't have enough fuel!"
      end
  end
end
