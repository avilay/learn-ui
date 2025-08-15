<script lang="ts">
  import { invalidate } from '$app/navigation';
  import type { PageProps } from './$types';
  import Posts from "./Posts.svelte";
  import Post from "./Post.svelte";

  type PostModel = {
    postId: number,
    title: string,
    content: string
  }

  let { data }: PageProps = $props();
  let post: PostModel | undefined = $state();
  let invalidating: Promise<void> | undefined = $state();

  function genShowPostWithId(postId: number) {
    return () => {
      post = data.posts.find((post: PostModel) => post.postId === postId);
    }
  }

  function showPosts() {
    post = undefined;
  }

  function refreshPosts() {
    invalidating = invalidate("http://localhost:8000/posts");
  }

</script>

{#if post}
  <Post {post} {showPosts} />
{:else}
  <Posts posts={data.posts} {genShowPostWithId} {refreshPosts} {invalidating}/>
{/if}
