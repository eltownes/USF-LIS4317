Time Series and Visualization

This post covers the early 2015 “Occupancy Detection Data Set” from the UC Irvine Machine Learning Repository – data is here.

Verbatim information for the data set follows:

“Abstract: Experimental data used for binary classification (room occupancy) from Temperature, Humidity, Light and CO2. Ground-truth occupancy was obtained from time stamped pictures that were taken every minute."

The data set includes 3 files that were bound together. The 3 files did not have contiguous times, so the plot will have some non-recorded values. The overall data set I used has a cleaned dimension of 20560 x 7.

The variables show that when the office room is occupied (teal color), some lights are turned on (measured in Lux) and the temperature in the room increases. This latter makes sense as it is early February and the heater is most likely turned on. The CO2 levels measure exhaled air. It is interesting to see the higher levels on 9 February and it's possible to speculate that maybe there was a meeting held in that room. The 2 humidity variables also seem to validate room occupancy.