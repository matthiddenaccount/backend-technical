class Recording
    attr_accessor :camera_id, :license, :timestamp
    def initialize(camera_id, license, timestamp)
        @camera_id = camera_id
        @license = license
        @timestamp = timestamp
    end

    def isGreater(other_recording)
        self.timestamp > other_recording.timestamp
    end
end