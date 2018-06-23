import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/airbnb.css" // A path to the theme CSS
import { French } from "flatpickr/dist/l10n/fr.js"

flatpickr(".datepicker", {
  locale: 'fr',
  altFormat: "d F Y",
  altInput: true,
})
