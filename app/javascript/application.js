// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// Ensure that Rails UJS is properly imported
import Rails from "@rails/ujs";
Rails.start();

import { Turbo } from "@hotwired/turbo-rails";
Turbo.start();

// Event listener for document load or turbo load
document.addEventListener("turbo:load", function() {
    const deleteButtons = document.querySelectorAll(".delete-btn");

    deleteButtons.forEach(button => {
        button.addEventListener("click", function(event) {
            event.preventDefault();
            const confirmed = confirm("Are you sure you want to delete this article?");
            if (confirmed) {
                const url = this.getAttribute("href");
                fetch(url, {
                    method: 'DELETE',
                    headers: {
                        'X-CSRF-Token': Rails.csrfToken(), // Ensure CSRF token is sent
                        'Accept': 'text/vnd.turbo-stream.html'
                    }
                }).then(response => {
                    if (response.ok) {
                        window.location.href = "/"; // Redirect to the main page or wherever necessary
                    } else {
                        alert("Failed to delete the article");
                    }
                });
            }
        });
    });
});


