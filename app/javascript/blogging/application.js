import '@hotwired/turbo-rails'

import { Application } from '@hotwired/stimulus'

import {
  DatepickerController,
  NotificationController,
  SlimSelectController,
  SubmitButtonController
} from 'frontend-helpers'

import { ModalController } from 'bali-view-components'

import { PopupOpenerController } from './popup_opener_controller'

require('trix')
require('@rails/actiontext')

const application = Application.start()

application.register('modal', ModalController)
application.register('notification', NotificationController)
application.register('slim-select', SlimSelectController)
application.register('submit-button', SubmitButtonController)
application.register('datepicker', DatepickerController)
application.register('popup-opener', PopupOpenerController)
