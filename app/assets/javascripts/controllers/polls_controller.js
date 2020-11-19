import { Controller } from "stimulus"

import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "searchItem", "choices", "content" ]

  new(event) {
    const id = $(event.target).parents('li')[0].id

    if (this.choicesTarget.value.length <= 0) {
      var choices = id
    } else {
      var choices = this.choicesTarget.value.split(',')
      if (!choices.includes(id) && choices.length < 5) {
        choices.push(id)
      }
      choices = choices.join(',')
    }

    this.choicesTarget.value = choices
  }

  show() {    
    if (this.choicesTarget.value.length > 0) {
      
    }
  }

}