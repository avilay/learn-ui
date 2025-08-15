<script lang="ts">
  type Cookie = {
    flavor: string;
    calories: number;
  };

  let { jar } = $props();
  const cookies: string[] = jar.cookie.load_cookies();
  let cookie: Cookie | null = $state(null);

  function getCookie() {
    cookie = jar.cookie.load_cookie("Chocolate Chip");
    console.log(typeof cookie);
  }
</script>

<h1>Cookies</h1>
<ul>
  <li>{cookies[0]}</li>
  <li>{cookies[1]}</li>
  <li>{cookies[2]}</li>
</ul>
{#if cookie}
<p>
  {cookie.flavor} cookie has {cookie.calories} calories.
</p>
{/if}
<button onclick={getCookie}>Get Cookie!</button>