<script>
  import { counter } from "./shared.svelte.js";
</script>

<style>
    button {
    display: inline-block;
    background-color: darkslategray;
    color: antiquewhite;
    padding: 0.5em 1.25em;
    font-size: 1.2em;
    font-family: cursive;
    text-align: center;
    border: 0;
    cursor: pointer;
  }
</style>

<button onclick={() => counter.count += 1}>clicks: {counter.count}</button>