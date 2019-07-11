// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

const Cable = ActionCable.createConsumer();
TIMERS = 'http://localhost:3000/'


const TimersCable = Cable.subscriptions.create("TimersChannel", {
    received: data => {
        renderTimers(data)
        console.log("Got a message for you: ", data)
    },
})

const fetch_timers = () => {

    fetch(`${TIMERS}/timers`, { headers: { 'Accept': 'application/json' } })
        .then(data => data.json())
        .then(obj => renderTimers(obj))
}

const fetchDeleteTimer = (timerId) => {
    const token = document.getElementsByName("csrf-token")[0].content
    fetch(`${TIMERS}/timers/${timerId}`, { method: 'delete', headers: { 'X-CSRF-Token': token } })

}

const renderTimerLi = (timer_obj) => {
    const elem = document.createElement('li')
    const btn = document.createElement('button')
    const timersUl = document.querySelector("ul")


    elem.innerText = `${timer_obj.username} for ${timer_obj.timer.duration} ${timer_obj.timer.duration == 1 ? 'min' : 'mins'}`
    btn.innerText = "I'm done!"
    btn.addEventListener('click', (e) => {
        e.preventDefault()
        fetchDeleteTimer(timer_obj.timer.id)
    })
    elem.append(btn)
    timersUl.appendChild(elem)
}

const renderTimers = (timers) => {
    const timersUl = document.querySelector("ul")

    timersUl.innerHTML = ''
    timers.map(renderTimerLi)
}

function init() {
    fetch_timers()
}

document.addEventListener("turbolinks:load", () => {
    init()
})