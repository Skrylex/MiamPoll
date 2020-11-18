import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "field" ]

  searchPlaces() {
    console.log("search")

  }
}