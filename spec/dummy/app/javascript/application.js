// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import { application } from 'controllers/application'
import { Turbo } from '@hotwired/turbo-rails'
import { DatepickerController } from 'bali/datepicker'
import { ModalController } from 'bali/modal'
import { NavbarController } from 'bali/navbar'
import { NotificationController } from 'bali/notification'
import { SideMenuController } from 'bali/side-menu'
import { SlimSelectController } from 'bali/slim-select'
import { SubmitButtonController } from 'bali/submit-button'
import { PopupOpenerController } from 'blogging/popup-opener'
import * as ActiveStorage from '@rails/activestorage'
import 'controllers'
import 'trix'
import '@rails/actiontext'

ActiveStorage.start()

window.Turbo = Turbo

application.register('datepicker', DatepickerController)
application.register('modal', ModalController)
application.register('navbar', NavbarController)
application.register('notification', NotificationController)
application.register('side-menu', SideMenuController)
application.register('slim-select', SlimSelectController)
application.register('submit-button', SubmitButtonController)
application.register('popup-opener', PopupOpenerController)
