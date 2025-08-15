<script lang="ts">
  import { page } from '$app/state';
</script>

<h1>{page.url.pathname} has an error!</h1>
{#if page.status === 500}
  <p>We are working tirelessly to resolve this problem.</p>
{:else if page.error}
  <p>Got error {page.status}: {page.error.message}</p>
{:else}
  <p>Got error {page.status}.</p>
{/if}