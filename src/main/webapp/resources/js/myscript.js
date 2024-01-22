/**
 * myscript.js
 */
 
 function toDateString(milli) {
 	var d = new Date(milli);
 	var year = d.getFullYear();
 	var month = make2digits(d.getMonth() + 1);
 	var day = make2digits(d.getDate());
 	var hour = make2digits(d.getHours());
 	var minute = make2digits(d.getMinutes());
 	var second = make2digits(d.getSeconds());
 	return year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second;
 }
 
 function make2digits(val) {
 	return (val < 10) ? "0" + val : val;
 }