<script lang="ts">
    import { error } from "@sveltejs/kit";
  import { flaky_roll, roll } from "./utils.js";

  let promise1 = $state(flaky_roll());
  let promise2 = $state(roll());
</script>

<button onclick={() => promise1 = flaky_roll()}>Roll the flaky dice</button>

{#await promise1}
  <p>...rolling</p>
{:then number}
  <p>You rolled {number}</p>
{:catch err}
  <p>{err.message}</p>
{/await}

<button onclick={() => promise2 = roll()}>Roll the good dice</button>
{#await promise2 then number}
  <p>You rolled a {number}</p>
{/await}