import '../scss/main.scss'
import { Application, Controller } from '@hotwired/stimulus'

declare const Stimulus: Application

class ChecklistController extends Controller {
  static targets = ['input']

  public inputTarget?: HTMLInputElement

  onToggle = (event: Event): void => {
    event.preventDefault()

    if (!this.inputTarget) {
      throw new Error('Input element is undefined')
    }

    const current = this.inputTarget.value === 'true' ? true : false

    const change = !current
    this.inputTarget.value = change.toString()

    this.dispatch('submit')
  }
}

class ChecklistFormController extends Controller {
  onSubmit(): void {
    const form = this.element as HTMLFormElement
    form.submit()
  }
}

Stimulus.register('checklist', ChecklistController)
Stimulus.register('checklist-form', ChecklistFormController)
