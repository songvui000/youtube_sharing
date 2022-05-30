export const fetchAPI = (url, options = {}) => {
  return fetch(url, options)
    .then(response => {
      if (response.redirected) {
          window.location.href = response.url;
      } else {
        return response.json()
      }
    })
    .catch(function(err) {
        console.info(err + " url: " + url);
    });
}
