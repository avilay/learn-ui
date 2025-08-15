// place files you want to import through the `$lib` alias in this folder.
import { loadPyodide } from 'pyodide';

export async function loadPyJar() {
	let pyodide = await loadPyodide();
	await pyodide.loadPackage('micropip');
	const micropip = pyodide.pyimport('micropip');
	await micropip.install('snowballstemmer');
	let response = await fetch('http://localhost:5173/jar.zip'); // .zip, .whl, ...
	let buffer = await response.arrayBuffer();
	pyodide.unpackArchive(buffer, 'zip'); // by default, unpacks to the current dir
	return [pyodide, pyodide.pyimport('jar')];
}
