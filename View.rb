SPEED_LIMIT = 100 # km/h

class View
    def displaySpeedCalculation(license, speed)
        puts("("+license+", "+(speed>SPEED_LIMIT).to_s+") ("+speed.to_s+" km/h)")
    end
end