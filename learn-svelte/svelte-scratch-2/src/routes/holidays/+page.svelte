<script lang="ts">
  import { onMount } from "svelte";
  import { loadPyJar } from "$lib";

  let holidays: string[] = $state([]);
  let jar: any = $state(null);
  let disabled: boolean = $state(true);

  onMount(async () => {
    let [tmp, jar_] = await loadPyJar();
    jar = jar_;
    disabled = false;
  });

  function loadHolidays() {
    holidays = jar.cookie.load_holidays();
  }
</script>

<h1>Holidays</h1>
{#if holidays.length > 0}
  <ul>
    {#each holidays as holiday}
      <li>{holiday}</li>
    {/each}
  </ul>
{:else}
  {#if disabled}
    <button onclick={loadHolidays} disabled>Load Holidays</button>
  {:else}
    <button onclick={loadHolidays}>Load Holidays</button>
  {/if}
{/if}