import "@hotwired/turbo-rails"
import "controllers"
import Rails from "@rails/ujs";
Rails.start();

import { Turbo } from "@hotwired/turbo-rails";
Turbo.start();

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
                        'X-CSRF-Token': Rails.csrfToken(),
                        'Accept': 'text/vnd.turbo-stream.html'
                    }
                }).then(response => {
                    if (response.ok) {
                        window.location.href = "/";
                    } else {
                        alert("Failed to delete the article");
                    }
                });
            }
        });
    });
});


