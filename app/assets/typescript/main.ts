import '../scss/main.scss'
import { Application, Controller } from '@hotwired/stimulus'

declare const Stimulus: Application

class stepController extends Controller {
  public done = false

  connect() {
    console.log(this.done)
  }
}

Stimulus.register('step', stepController)
