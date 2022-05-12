import '@hotwired/turbo-rails'

import { Application } from '@hotwired/stimulus'
import { NotificationController, SlimSelectController } from 'frontend-helpers'

require('trix')
require('@rails/actiontext')

const application = Application.start()

application.register('notification', NotificationController)
application.register('slim-select', SlimSelectController)
