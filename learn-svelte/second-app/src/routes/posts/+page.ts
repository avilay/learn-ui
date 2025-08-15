import type { PageLoad } from './$types';

export const load: PageLoad = async ({fetch}) => {
    console.log("Starting fetch");
    try {
        const response = await fetch('http://localhost:8000/posts');
        let posts = [];
        if (response.ok) {
            console.log("Got OK response");
            posts = await response.json();
        } else {
            console.log("Did not get OK response");
        }
        return {posts: posts};
    } catch (error) {
        const err = error as Error;
        console.error('Error fetching data:', err.message);
        throw new Error("Unable to fetch the latest posts!");
    }
}
