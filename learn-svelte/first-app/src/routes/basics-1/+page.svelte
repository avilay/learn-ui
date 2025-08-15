<script lang="ts">
  import Nested from "./Nested.svelte";
  
  let name = "Svelte";
  let imgDesc = "A generic yellow block with a dark yellow border.";
  let src = "/generic-256x256-border.png"
  let count = $state(0);

  function increment() {
    count += 1;
  }

  let numbers = $state([1, 2, 3, 4]);
  
  function appendNumber() {
    numbers.push(numbers.length + 1);
    // The following log is not going to work because numbers is a reactive proxy
    // not a "real" variable.
    // console.log(numbers);
    // If I need to, I should log a snapshot of the state.
    // Actually the above line is intercepted by Svelte and it ends up logging 
    // the snapshot anyway albeit with a warning.
    // console.log($state.snapshot(numbers));
    // Alernatively I can inspect this particular state and get its change lineage.
  }

  // derived states are read-only
  let total = $derived(numbers.reduce((acc, n) => acc + n));

  $inspect(numbers).with(console.trace);

</script>

<style>
  p {
    color: goldenrod;
    font-family: 'Courier New', Courier, monospace;
    font-size: 1.2em;
  }

  button {
    display: inline-block;
    background-color: darkslategray;
    color: antiquewhite;
    padding: 0.5em 1.25em;
    text-align: center;
    border: 0;
    cursor: pointer;
  }
</style>

<h1>Hello from {name}!</h1>
<img {src} alt="Description is {imgDesc}" />
<p>
  It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness.
</p>

<Nested />

<button onclick={increment}>
  Clicked {count} {count === 1 ? "time" : "times"}
</button>

<p>{numbers.join(" + ")} = {total}</p>
<button onclick={appendNumber}>
  Append a number
</button>