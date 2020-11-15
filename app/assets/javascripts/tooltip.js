import tippy, {delegate} from "tippy.js"
import 'tippy.js/animations/scale'

tippy.setDefaultProps({
    onShow(instance) {
        instance.setContent(instance.reference.getAttribute(`data-tippy-content`))
    },
    animation: 'scale',
    trigger: 'mouseenter',
    touch: 'hold',
    delay: 0,
    duration: 100,
    allowHTML: true
})

delegate('html', { target: '[data-tippy-content]' })