const initLocationFinder = () => {
 navigator.geolocation.getCurrentPosition((data) => {
console.log(data)
    })

}

export { initLocationFinder };