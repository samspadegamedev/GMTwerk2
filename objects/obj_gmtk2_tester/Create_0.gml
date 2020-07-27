///@desc Run all tests
var timeA = current_time;
var fails = 0;
	
/** vv Place synchronous tests here vv **/
fails += gmtk2_test_all();
/** ^^ Place tests here ^^ **/
	
var timeB = current_time;
layer_background_blend(layer_background_get_id(layer_get_id("Background")), (fails == 0) ? c_yellow : c_red);

/** vv Place asynchronous tests here vv **/
progress = 0;
maxProgress = 27;
progressUp = function() {
	++progress;
};

// Delay (1)
Delay(1000, progressUp);

// Repeat (3)
Repeat(300, 3, progressUp);

// ForEach (5)
ForEach(200, ["foo", "bar", "baz", "qux", "waahoo"], progressUp);

// While (
whilenum = 4;
While(200, function() {
	return whilenum > 0;
}, function() {
	--whilenum;
	++progress;
});

// WhenTrue
WhenTrue(function() {
	return alarm[0] < 10;
}, progressUp);

// WhenToggle
WhenToggle(function() {
	return 10 <= alarm[0] && alarm[0] <= 20;
}, progressUp, progressUp);

// Itinerary
Itinerary(0, [
	[100, progressUp],
	[300, progressUp],
	[700, progressUp],
]);
Itinerary(900, [
	[700, progressUp],
	[500, progressUp],
	[300, progressUp],
]);

// LogValue
LogValue(DataUnit(0), 3, 200, "onLog", progressUp);

// Timeout for asynchronous test is 1 second (plus one step)
alarm[0] = room_speed+1;
/** ^^ Place asynchronous tests here ^^ **/
