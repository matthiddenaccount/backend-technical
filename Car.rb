require './Recording.rb'

MINUTES_PER_HOUR = 60
SECONDS_PER_MINUTE = 60 

class Car

    attr_accessor :license, :recordings

    def initialize(license)
        @license = license
        @recordings = []
    end

    def addRecording(new_recording)
        if @recordings.empty?
            @recordings << new_recording # if this is the first recoding, we don't need to worry about chronological order and can just add it
        else
            for i in 0...@recordings.size # if this is not the first recording, we want to add it to the array while maintaining the chronologial order of the recordings
                
                inserted = false # temporary boolean that represents whether we inserted yet or not
                if @recordings[i].isGreater(new_recording)
                    @recordings.insert(i, new_recording)
                    inserted = true
                    break
                end

                if !inserted # if we did not insert the recording in the the middle of the array, add it to the end of the array
                    @recordings << new_recording
                end
            end
        end
    end

    def calculateSpeed() # returns speed in km/h not km/s
        speed = ((@recordings[1].camera_id - @recordings[0].camera_id)/(@recordings[1].timestamp - @recordings[0].timestamp).to_f*MINUTES_PER_HOUR*SECONDS_PER_MINUTE).round(1)
    end
end