<script lang="ts">
  const emojis: Record<string, string> = {
    "apple": "🍎",
    "banana": "🍌",
    "carrot": "🥕",
    "doughnut": "🍩",
    "egg": "🥚"
  };

  export let name: string;
  
  const emoji = emojis[name];
</script>

<p>{emoji} = {name}</p>