<script lang="ts">
  let { post, showPosts } = $props();
</script>

<header>
  <h1>{post.title}</h1>
  <button type="button" onclick={showPosts}>Back</button>
</header>
<p>{post.content}</p>

<style>
  header {
    display: flex;
    flex-flow: row nowrap;
    justify-content: flex-start;
    gap: 1em;
  }

  button {
    margin-left: auto;
    border: none;
    background: none;
    text-decoration: underline;
    color: inherit;
    font-weight: inherit;
  }

  button:focus, button:hover {
    font-weight: bold;
  }
</style>