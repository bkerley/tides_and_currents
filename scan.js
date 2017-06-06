// %w{geoGroupName stationId lat lon}

var best_stn = null;
var best_dist = 999999999;

for (var i = 0; i < lats.length ; i++) {
    var cur_stn = lats[i];

    var cur_dist = getDistanceFromLatLongInKm(cur_stn[2], cur_stn[3],
                                              latidude, longitude);

    if (Math.abs(cur_dist) < Math.abs(best_dist)) {
        best_stn = cur_stn;
        best_dist = Math.abs(cur_dist);
    }
}

var passy = best_stn[1] + "_annual.xml";
