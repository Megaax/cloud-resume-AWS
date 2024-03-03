// index.js

document.addEventListener("DOMContentLoaded", function () {
    // Fetch the counter value from the Lambda function
    fetch('https://nfynpwgw44stmt5cj2d2iwrbdi0kahxp.lambda-url.us-east-1.on.aws/')
        .then(response => response.json())
        .then(data => {
            // Update the HTML content with the counter value
            document.querySelector('.counter-number').textContent = data.views;
        })
        .catch(error => console.error('Error fetching counter:', error));
});
