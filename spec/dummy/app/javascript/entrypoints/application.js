// Rails libraries
import * as Turbo from '@hotwired/turbo'
import { Application } from '@hotwired/stimulus'
import * as ActiveStorage from '@rails/activestorage'
import Trix from 'trix' // eslint-disable-line

// Register all Bali controllers and components
import { registerAll } from 'bali'

// Initialize Stimulus
const application = Application.start()
window.Stimulus = application

// Make Turbo available globally
window.Turbo = Turbo

// Initialize ActiveStorage
ActiveStorage.start()
registerAll(application)
