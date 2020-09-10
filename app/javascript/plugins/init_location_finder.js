// const initLocationFinder = () => {
//  navigator.geolocation.getCurrentPosition((data) => {
// console.log(data)
//     })

// }



function getGeoLocation() {
    navigator.geolocation.getCurrentPosition(setGeoCookie);
  }
  function setGeoCookie(position) {
    let cookie_val = position.coords.latitude + "|" + position.coords.longitude;
    document.cookie = "lat_lng=" + escape(cookie_val);
    console.log(document.cookie)
  }

  export { getGeoLocation };