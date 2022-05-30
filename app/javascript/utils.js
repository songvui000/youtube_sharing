export const fetchAPI = (url, options = {}) => {

  fetch(url, options)
    .then(response => {
      if (response.redirected) {
          window.location.href = response.url;
      } else {
        response.json()
      }
    })
    .catch(function(err) {
        console.info(err + " url: " + url);
    });
}
