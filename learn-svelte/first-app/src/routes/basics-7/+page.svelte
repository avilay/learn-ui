<script lang="ts">
// Any DOM event like `click` or `pointermove` can be handled with a `on<eventname>`
// handler. And as is usual with Svelte, if the attribute and its value are the same
// symbol I can use shorthand, e.g., onpointermove={onpointermove} can be written
// as {onpointermove}.

// Events are bubbled up from the innermost element to the outermost element. See
// the first bubbling example where the input box's event handler is called first
// and then the div's event handler. But I can change the order as can be seen
// in the second capture example.

// Event handlers can be passed down as props.

let msg = $state("");

function handle_click() {
  msg = "You clicked!"
}

let m = $state({x: 0, y: 0});
function onpointermove(event: PointerEvent) {
  m.x = event.clientX;
  m.y = event.clientY;
}

import Stepper from "./Stepper.svelte";
let value = $state(0);
</script>

<div class="pointer" {onpointermove}>
  The pointer is at {Math.round(m.x)} x {Math.round(m.y)}
</div>

<button onclick={handle_click}>Click Me!</button>
<p>{msg}</p>

<h3>Event Bubbling</h3>
<div onkeydown={(e) => alert(`<div> ${e.key}`)} role="presentation">
  <input onkeydown={(e) => alert(`<input> ${e.key}`)} />
</div>

<h3>Event Capture</h3>
<div onkeydowncapture={(e) => alert(`<div> ${e.key}`)} role="presentation">
  <input onkeydowncapture={(e) => alert(`<input> ${e.key}`)} />
</div>

<h3>Event Handlers as Props</h3>
<p>The current value is {value}</p>
<Stepper increment={() => value += 1} decrement={() => value -= 1} />

<style>
  .pointer {
    height: 50%;
    padding: 1.5em;
    outline: 1px solid dimgray;
    margin-bottom: 3em;
  }
</style>