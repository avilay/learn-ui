<script lang="ts">
  import { page, navigating } from '$app/state';

  let { children } = $props();
</script>

<nav>
  <ul>
    <li aria-current={page.url.pathname === '/' ? 'page' : undefined}><a href="/">Home</a></li>
    <li aria-current={page.url.pathname === '/about' ? 'page' : undefined}><a href="/about">About</a></li>
    <li aria-current={page.url.pathname === '/posts' ? 'page' : undefined}><a href="/posts">Posts</a></li>
  </ul>
</nav>
<div class="container">
  {#if navigating.to}
    <p>Loading {navigating.to.url.pathname}...</p>
  {:else}
    {@render children()}
  {/if}
</div>

<style>
  nav {
    background-color: antiquewhite;
    padding: 1em;
  }

  nav > ul {
    margin: 0;
    padding: 0;
    display: flex;
    flex-flow: row nowrap;
    justify-content: flex-start;
    align-items: center;
    gap: 1em;
  }

  nav > ul > li {
    list-style-type: none;
  }

  nav > ul > li > a {
    text-decoration: none;
    color: inherit;
    font-weight: inherit;
  }

  nav > ul > li[aria-current="page"], nav > ul > li > a:focus, nav > ul > li > a:hover {
    font-weight: bold;
  }

  .container {
    width: 80%;
    margin: 0 auto;
  }
</style>