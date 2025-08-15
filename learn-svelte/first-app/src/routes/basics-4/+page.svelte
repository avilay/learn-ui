<script lang="ts">
  let count: number = $state(0);

  function increment() {
    count += 1;
  }
</script>

<button onclick={increment}>
  Clicked {count} {count === 1 ? "time" : "times"}
</button>

{#if count > 10}
  <p>{count} is really high!!</p>
{:else if count < 5}
  <p>{count} is too low!</p>
{:else}
  <p>{count} is reasonable.</p>
{/if}