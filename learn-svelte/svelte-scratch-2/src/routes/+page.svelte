<script lang="ts">
  import { onMount } from "svelte";
  import { loadPyJar } from "$lib";
  import Cookies from "./Cookies.svelte";

  let jar: any = $state(null);
  let pyodide: any = $state(null);

  onMount(async () => {
    let [pyodide_, jar_] = await loadPyJar();
    pyodide = pyodide_;
    jar = jar_;
  });

  async function chooseDir() {
    const dirHandle = await (window as any).showDirectoryPicker();
    const permissionStatus = await dirHandle.requestPermission({mode: "readwrite"});

    if (permissionStatus !== "granted") {
      throw new Error("readwrite access to directory not granted");
    }

    await pyodide.mountNativeFS("/mount_dir", dirHandle);

    console.log(jar.cookie.listdir());
    console.log(jar.cookie.stem());
  }
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://svelte.dev/docs/kit">svelte.dev/docs/kit</a> to read the documentation</p>
{#if jar}
<Cookies {jar}></Cookies>
{:else}
<p>Loading...</p>
{/if}
<button onclick={chooseDir}>Choose Directory</button>