//simple counter rpm


var needleCount = 0;
var readoutCount =0;
var maxNeedleRpm = 1100;
var idleNeedleRpm =100;
var maxDisplayRpm = 1100;
var idleDisplayRpm =100;
var reverse = false;


function setNeedleRpm() {
  values.rpm = (needleCount*10)
}

function setDisplayRpm() {
   values.displayRpm = (readoutCount+"0")
}


    function dialTimer()
        {
            if (!reverse)
            {
            if (needleCount < maxNeedleRpm)

            {
                needleCount++
                // console.log ((needleCount)+ "needle rpm");

            }

            else {
                reverse = true;
            }
        }
            else {
                if (needleCount > idleNeedleRpm)
                {
                needleCount --
                // console.log ((needleCount)+ "needle rpm");

            }

            else {
                reverse = false
            }
        }

            setNeedleRpm()
    }

function readoutTimer()
    {
        if (!reverse)
        {
        if (readoutCount < maxDisplayRpm)

        {
            readoutCount++
            // console.log ((readoutCount)+ "readout rpm");

        }

        else {
            reverse = true;
        }
    }
        else {
            if (readoutCount > idleDisplayRpm)
            {
            readoutCount --
            console.log ((readoutCount)+ "readout rpm");

        }

        else {
            reverse = false
        }
    }

        setDisplayRpm()
}
