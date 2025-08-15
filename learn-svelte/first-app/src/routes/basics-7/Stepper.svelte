<script lang="ts">
  export let increment: () => void;
  export let decrement: () => void;
</script>

<button onclick={decrement}>-1</button>
<button onclick={increment}>+1</button>