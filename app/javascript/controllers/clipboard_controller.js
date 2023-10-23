import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["email", "copyButton"]

    copy() {
        navigator.clipboard.writeText(this.emailTarget.textContent)
        this.copyButtonTarget.innerText = 'copied'

        setTimeout(() => {
            this.copyButtonTarget.innerText = 'copy'
        }, "1000")
    }
}