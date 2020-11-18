import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "searchItem", "choices", "content" ]

  new(event) {
    const id = $(event.target).parents('li')[0].id
    console.log("PLACE ID : ", id)

    if (this.choicesTarget.value.length <= 0) {
      var choices = id
    } else {
      var choices = this.choicesTarget.value.split(',')
      if (!choices.includes(id) && choices.length < 5) {
        choices.push(id)
      }
      choices = choices.join(',')
    }
    console.log('BASE CHOICES : ', choices)

    this.choicesTarget.value = choices
    console.log('END CHOICES : ', this.choicesTarget.value)
  }

  show() {    
    if (this.choicesTarget.value.length > 0) {
      
    }
  }

}