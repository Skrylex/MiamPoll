import { Controller } from "stimulus"

import Rails from "@rails/ujs";

export default class extends Controller {
  static targets = [ "searchItem", "choices", "content" ]

  new(event) {
    const id = $(event.target).parents('li')[0].id

    if (this.choicesTarget.value.length <= 0) {
      var choices = id
      this.show(id)
    } else {
      var choices = this.choicesTarget.value.split(',')
      if (!choices.includes(id) && choices.length < 5) {
        choices.push(id)
        this.show(id)
      }
      choices = choices.join(',')
    }

    this.choicesTarget.value = choices
  }

  show(id) {    
    const element = $(`li#${id}`).find('button').html()
    console.log(element)

    $(this.contentTarget).append(`<div class="mp-vote-radio" data-id="${id}" data-tippy-content="Retirer"><button type="button" class="mp-vote" data-action="click->polls#destroy">${element}</button></div>`)
  }

  destroy(event) {
    const element = $(event.target).parents('.mp-vote-radio')
    const id = element.attr('data-id')
    var choices = []

    this.choicesTarget.value.split(',').forEach((choice) => {
      if (choice != id) {
        choices.push(choice)
      } else {
        element.remove()
      }
    })

    if (choices.length > 0) {
      choices = choices.join(',')      
    } else {
      choices = ""
    }

    this.choicesTarget.value = choices
  }

}