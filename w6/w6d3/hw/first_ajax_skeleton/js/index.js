console.log("HELLO FROM THE JAVASCRIPT CONSOLE!");
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log(data.weather[0].description);
  },
  error() {
    console.error("An error occurred.");
  },
});
