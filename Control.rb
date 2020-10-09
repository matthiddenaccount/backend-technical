require './Recording.rb'
require './Car.rb'
require './View.rb'

class Control

    def initialize()
        @recorded_cars = {}
        @view = View.new
    end
    
    def launch()
        initScenarioOne() # use first set of test inputs and outputs
        # initScenarioTwo() # use second set of test inputs and outputs
    end

    def receiveCameraRecording(recording)
        # If we have not yet recorded a car with this license plate, add a new car so that key in the map isn't nil
        if @recorded_cars[recording.license].nil?
            @recorded_cars[recording.license] = Car.new(recording.license)
        end

        # Add the recording the the newly created car object
        @recorded_cars[recording.license].addRecording(recording)

        # If we have enough recordings to calculate a velocity...
        if @recorded_cars[recording.license].recordings.length == 2 
            averageSpeed = @recorded_cars[recording.license].calculateSpeed()
            @view.displaySpeedCalculation(recording.license, averageSpeed)
        end
    end

    def initScenarioOne()    
        receiveCameraRecording(Recording.new(1, "ABC-123", 1599066000))
        receiveCameraRecording(Recording.new(2, "ABC-123", 1599066030))  
        receiveCameraRecording(Recording.new(1, "DEF-123", 1599062378))
        receiveCameraRecording(Recording.new(2, "DEF-123", 1599062414))
        receiveCameraRecording(Recording.new(1, "GHI-123", 1599062435))
        receiveCameraRecording(Recording.new(2, "GHI-123", 1599062495))
        receiveCameraRecording(Recording.new(1, "JKL-123", 1599066000))
        receiveCameraRecording(Recording.new(2, "JKL-123", 1599066035))
    end

    def initScenarioTwo()
        receiveCameraRecording(Recording.new(2, "JKL-123", 1599066035))
        receiveCameraRecording(Recording.new(2, "ABC-123", 1599066030))
        receiveCameraRecording(Recording.new(1, "ABC-123", 1599066000))
        receiveCameraRecording(Recording.new(2, "DEF-123", 1599062414))
        receiveCameraRecording(Recording.new(1, "GHI-123", 1599062435))
        receiveCameraRecording(Recording.new(2, "GHI-123", 1599062495))
        receiveCameraRecording(Recording.new(1, "JKL-123", 1599066000))
        receiveCameraRecording(Recording.new(1, "DEF-123", 1599062378))
    end
end