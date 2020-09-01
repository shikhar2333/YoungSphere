
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "topic" ]

  connect() {
    // this.outputTarget.textContent = 'Hello, Stimulus!'
    console.log("this is connected")
    if(this.hasTopicTarget) {
      $(this.topicTarget).selectize({
        create: function(input, callback) {
          console.log(input);
          $.ajax({
            method: "POST",
            url: '/topics',
            dataType: "json",
            contentType: 'application/json',
            data: JSON.stringify({topic: {name: input}}),
            success: function(response) {
              console.log(response)
              callback({value: response.id, text: response.name});
            },
            error: function (jqXHR, textStatus, errorThrown) {
              if (jqXHR.status == 500) {
                alert('Internal error: ' + jqXHR.responseText);
              } else {
                alert('Unexpected error.');
              }
              callback();
            }

          });



        }
      });
    }
  }
}
