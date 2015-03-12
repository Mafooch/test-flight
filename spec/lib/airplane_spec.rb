require 'pry'
require_relative "../../lib/airplane"

describe Airplane do

  describe "#initialize" do
    my_plane = Airplane.new("cesna", 10, 150)

    it "returns cesna for type" do
      expect(my_plane.type).to eq("cesna")
    end
    it "returns 10 for wingloading" do
      expect(my_plane.wing_loading).to eq(10)
    end
    it "returns 150 for horsepower" do
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#land" do
    context "When airplane not has not been started" do
      unstarted_airplane = Airplane.new("cesna", 10, 150)

      it "returns 'airplane not started, please start'" do
        expect(unstarted_airplane.land).to eq "airplane not started, please start"
      end
    end

    context "When airplane has been started but hasn't taken off" do
      started_airplane = Airplane.new("cesna", 10, 150)
      started_airplane.start

      it "returns 'airplane already on the ground'" do
        expect(started_airplane.land).to eq "airplane already on the ground"
      end
    end

    context "If plane is flying" do
      flying_airplane = Airplane.new("cesna", 10, 150)
      flying_airplane.start
      flying_airplane.takeoff

      it "returns 'airplane landed'" do
        expect(flying_airplane.land).to eq "airplane landed"
      end
    end

  end

  describe "#takeoff" do
    context "When plane hasn't been started yet" do
      unstarted_airplane = Airplane.new("cesna", 10, 150)

      it "returns 'airplane not started, please start'" do
        expect(unstarted_airplane.takeoff).to eq "airplane not started, please start"
      end

      it "@flying will be false" do
        expect(unstarted_airplane.flying).to eq false
      end
    end

    context "When the plane has been started." do
      started_airplane = Airplane.new("cesna", 10, 150)
      started_airplane.start

      it "returns 'airplane launched'" do
        expect(started_airplane.takeoff).to eq "airplane launched"
      end
      it "@flying will be true" do
        started_airplane.takeoff
        expect(started_airplane.flying).to eq true
      end
    end
  end

  describe "#start" do
    context "when the plane hasn't been started yet" do
      unstarted_airplane = Airplane.new("cesna", 10, 150)

      it "@started will be false" do
        expect(unstarted_airplane.started).to eq false
      end

      it "when started returns 'airplane started'" do
        expect(unstarted_airplane.start).to eq "airplane started"
      end

      it "@started will be flipped to true" do
        expect(unstarted_airplane.started).to eq true
      end
    end

    context "when the plane has already been started" do
      started_airplane = Airplane.new("cesna", 10, 150)
      started_airplane.start

      it "returns 'airplane already started'" do
        expect(started_airplane.start).to eq 'airplane already started'
      end
    end
  end

end