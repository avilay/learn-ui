<script lang="ts">
  import { navigating } from "$app/state";

  let { posts, genShowPostWithId, refreshPosts, invalidating } = $props();
</script>

<h1>Posts</h1>
<ul>
{#each posts as post}
  <li>
    <button 
      type="button" 
      onclick={(genShowPostWithId(post.postId))}
    >
      {post.title}
    </button>
  </li>
{/each}
</ul>

{#await invalidating}
  <button onclick={refreshPosts} disabled>Loading...</button>
{:then}
  <button onclick={refreshPosts}>Refresh</button>
{/await}

<style>
  li {
    margin-bottom: 1em;
  }

  li > button {
    border: none;
    background: none;
    color: inherit;
    text-decoration: underline;
    padding: 0;
    margin: 0;
  }

  li > button:hover, li > button:focus {
    font-style: italic;
  }

  button {
    display: inline-block;
    background-color: antiquewhite;
    color: darkslategray;
    padding: 0.5em 1.25em;
    text-align: center;
    border: 0;
    cursor: pointer;
    border-radius: 7px;
    margin-top: 1em;
  }

  button[disabled] {
    background-color: lightgray;
    cursor: progress;
  }
</style>