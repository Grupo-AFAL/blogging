import { Turbo } from '@hotwired/turbo-rails'
import { Application } from '@hotwired/stimulus'

import {
  NotificationController,
  SlimSelectController,
  SubmitButtonController
} from 'frontend-helpers'

require('trix')
require('@rails/actiontext')

const application = Application.start()

application.register('notification', NotificationController)
application.register('slim-select', SlimSelectController)
application.register('submit-button', SubmitButtonController)

window.Turbo = Turbo
