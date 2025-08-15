<script lang="ts">
  // The svelte tutorial said to use -
  // let { answer } = $props();
  // But according to co-pilot this is not standard usage. Below is the standard
  // way to declare properties.
  export let answer: number | string = "Anichya";
</script>

<p>The answer is {answer}</p>