<script lang="ts">
  import { fade, fly } from "svelte/transition";

  let visible = $state(true);
</script>

<label>
  <input type="checkbox" bind:checked={visible} />
  Visible
</label>

{#if visible}
  <p transition:fade>Fades in and out.</p>
  <p transition:fly={ {y: 200, duration: 2000} }>Flies in and out.</p>
  <p in:fly={ {y: 200, duration: 2000} } out:fade>Flies in and fades out.</p>
{/if}