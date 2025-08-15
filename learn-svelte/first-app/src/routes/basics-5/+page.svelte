<script lang="ts">
	import Thing from "./Thing.svelte";

	const colors = ['red', 'orange', 'yellow', 'green', 'blue', 'indigo', 'violet'];
	let selected = $state(colors[0]);

	let items = $state(["Item One", "Item Two", "Item Three", "Item Four", "Item Five"]);

	type Food = {
		id: number,
		name: string
	}

	let things: Food[] = $state([
		{id: 1, name: "apple"},
		{id: 2, name: "banana"},
		{id: 3, name: "carrot"},
		{id: 4, name: "doughnut"},
		{id: 5, name: "egg"}
	])
</script>

<h1 style="color: {selected}">Demo for <code>each</code></h1>
<p><code>each</code> can be used to iterate through a sequence of items that can be rendered.</p>
<div>
	{#each colors as color, i}
    <button
			class="color-button"
      style="background: {color}"
      aria-label={color}
      aria-current={selected === color}
      onclick={() => selected = color}
    >
      {i + 1}
    </button>
  {/each}
</div>

<h1>Demo of removing each items</h1>
<p>While it is ok mutating a sequences of simple items that was rendered using <code>each</code>...</p>
<ul>
	{#each items as item}
		<li>{item}</li>
	{/each}
</ul>

<button onclick={() => items.shift()}>Pop the first item</button>

<h1>Demo of pitfalls of mutating each items</h1>
<p>It can lead to weird behavior as mentioned in <a href="https://svelte.dev/tutorial/svelte/keyed-each-blocks">in the Svelte tutorial</a> that I didn't understand. But attempting to pop the first item will mess Things up.</p>

{#each things as thing}
	<Thing name={thing.name} />
{/each}

<button onclick={() => things.shift()}>Pop the first thing</button>

<h1>Fix for the above pitfall</h1>
<p>I should use some sort of key to identify the component so that Svelte will render the entire component again properly. This is similar to React where I need a key to iterate through items. Popping the first thing will work properly now.</p>

{#each things as thing (thing.id)}
	<Thing name={thing.name} />
{/each}

<button onclick={() => things.shift()}>Pop the first thing</button>

<style>
	h1 {
		font-size: 2rem;
		font-weight: 700;
		transition: color 0.2s;
	}

	div {
		display: grid;
		grid-template-columns: repeat(7, 1fr);
		grid-gap: 5px;
		max-width: 400px;
	}

	.color-button {
		aspect-ratio: 1;
		border-radius: 50%;
		/* background: var(--color, #fff); */
		transform: translate(-2px,-2px);
		filter: drop-shadow(2px 2px 3px rgba(0,0,0,0.2));
		transition: all 0.1s;
		color: black;
		font-weight: 700;
		font-size: 2rem;
	}

	.color-button[aria-current="true"] {
		transform: none;
		filter: none;
		box-shadow: inset 3px 3px 4px rgba(0,0,0,0.2);
	}
</style>
