import '@hotwired/turbo-rails'

import { Application } from '@hotwired/stimulus'
import { NotificationController } from 'frontend-helpers'

const application = Application.start()

application.register('notification', NotificationController)