<script lang="ts">
  // Demos two-way data binding, i.e., the name state is used by the input element
  // as a value, but it is also updated by the input element.
  let name = $state("world");
  
  let value = $state("It was the best of times, it was the worst of times")

  // bind also takes care of casting input values to the correct type
  let a = $state(1);
  let b = $state(2);

  let yes = $state(false);
  let flavors: string[] = $state([]);
  let numScoops = $state(1);

  // For dropdowns (select boxes), the value of an option can be an object in Svelte.
  type Question = {
    id: number,
    text: string
  }
  let questions: Question[] = $state([
    {id: 1, text: "Where did you go to school?"},
    {id: 2, text: "What is your mother's name?"},
    {id: 3, text: "What is another personal fact that an attacker can easily find with Google?"}
  ]);
  let selected: Question | undefined = $state();
  let answer = $state("");

  function handleSubmit(e: SubmitEvent) {
    e.preventDefault();
    if (selected) {
      alert(`Answered question ${selected.id} (${selected.text}) with "${answer}"`);
    } else {
      alert("No question selected!");
    }
  }


</script>
<h3>Text input</h3>

<input bind:value={name} />
<p>Hello, {name}!</p>

<!-- no need for bind:value={value}, using shorthand instead -->
<textarea bind:value></textarea>
<div>{value}</div>
<hr />

<label>
  <input type="number" bind:value={a} min="0" max="10" />
  <input type="range" bind:value={a} min="0" max="10" />
</label>

<label>
  <input type="number" bind:value={b} min="0" max="10" />
  <input type="range" bind:value={b} min="0" max="10" />
</label>

<p>{a} + {b} = {a + b}</p>

<hr />

<h3>Single checkboxes</h3>
<div>
  <label>
    <input type="checkbox" bind:checked={yes} />
    Yes! Send me regular email spam.
  </label>
</div>

{#if yes}
  <p>Thank you. We will bombard your inbox and sell your personal details.</p>
{:else}
  <p>You must opt in to continue. If you're not paying, you're the product.</p>  
{/if}

<hr />

<h3>Group of checkboxes</h3>
<ul>
{#each ["Cookies and Cream", "Mint Choc Chip", "Raspberry Ripple"] as flavor}
  <li style="list-style-type: none;">
    <label>
      <input type="checkbox" name="flavors" value={flavor} bind:group={flavors} /> {flavor}
    </label>
  </li>
{/each}
</ul>
<p>You like {flavors} ice cream!</p>

<hr />

<h3>Group of radio buttons</h3>
<ul>
{#each [1, 2, 3] as num}
  <li style="list-style-type: none">
    <label>
      <input 
        type="radio" 
        name="scoops" 
        value={num} 
        bind:group={numScoops}
      /> 
      {num} {num === 1 ? "scoop" : "scoops"}
    </label>
  </li>
{/each}
</ul>
<p>You want {numScoops} scoops.</p>

<hr />

<h3>Insecurity Questions</h3>
<form onsubmit={handleSubmit}>
  <select bind:value={selected} onchange={() => (answer = "")}>
    {#each questions as question}
      <option value={question}>
        {question.text}
      </option>
    {/each}
  </select>

  <input bind:value={answer} />

  <button disabled={!answer} type="submit">Submit</button>
</form>

<hr />

<h3>Multi-Select Boxes</h3>
<select multiple bind:value={flavors}>
  {#each ["Cookies and Cream", "Mint Choc Chip", "Raspberry Ripple"] as flavor}
    <option>{flavor}</option>
  {/each}
</select>