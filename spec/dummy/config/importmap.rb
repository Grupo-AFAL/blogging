# Pin npm packages by running ./bin/importmap

pin "application"

# Rails
pin "@rails/actioncable", to: "actioncable.esm.js"
pin "@rails/activestorage", to: "activestorage.esm.js"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin '@rails/request.js', to: 'https://cdn.jsdelivr.net/npm/@rails/request.js@0.0.9/+esm'

# Hotwired
pin "@hotwired/turbo-rails", to: "https://cdn.jsdelivr.net/npm/@hotwired/turbo-rails@8.0.5/+esm"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"

# Stimulus controllers
pin_all_from "app/javascript/controllers", under: "controllers"


# Trix
pin "trix", to: 'https://cdn.jsdelivr.net/npm/trix@2.1.3/+esm'

# Chart.js
pin "chart.js", to: 'https://cdn.jsdelivr.net/npm/chart.js@4.4.3/+esm'

# Lodash throttle/debounce
pin "lodash.throttle", to: 'https://cdn.jsdelivr.net/npm/lodash.throttle@4.1.1/+esm'
pin "lodash.debounce", to: 'https://cdn.jsdelivr.net/npm/lodash.debounce@4.0.8/+esm'

# Slim select
pin "slim-select", to: 'https://cdn.jsdelivr.net/npm/slim-select@2.8.2/+esm'

# Flatpickr (Datepicker)
pin 'flatpickr', to: 'https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/+esm'
pin 'flatpickr/dist/l10n/es.js', to: 'https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/dist/l10n/es.js'

# Bali Utils
pin "bali/utils/domHelpers", to: 'bali/utils/domHelpers.js'
pin "bali/utils/google-maps-loader", to: 'bali/utils/google-maps-loader.js'
pin "bali/utils/formatters", to: 'bali/utils/formatters.js'
pin "bali/utils/form", to: 'bali/utils/form.js'
pin "bali/utils/use-click-outside", to: 'bali/utils/use-click-outside.js'
pin "bali/utils/time", to: 'bali/utils/time.js'
pin "bali/utils/use-dispatch", to: 'bali/utils/use-dispatch.js'

# Bali Stimulus Controllers
pin 'bali/datepicker', to: 'bali/controllers/datepicker-controller.js'
pin 'bali/modal', to: 'bali/modal/index.js'
pin 'bali/navbar', to: 'bali/navbar/index.js'
pin 'bali/notification', to: 'bali/notification/index.js'
pin 'bali/side-menu', to: 'bali/side_menu/index.js'
pin 'bali/slim-select', to: 'bali/controllers/slim-select-controller'
pin 'bali/submit-button', to: 'bali/controllers/submit-button-controller'

pin 'blogging/popup-opener', to: 'blogging/popup_opener_controller.js'
