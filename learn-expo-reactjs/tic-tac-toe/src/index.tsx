import React, { StrictMode } from "react";
import { createRoot } from "react-dom/client";
import "./style.css";

import App from "./App";

let rootElem = document.getElementById("root");
if (rootElem != null) {
    let root = createRoot(rootElem);
    root.render(
        <StrictMode>
            <App />
        </StrictMode>
    );
} else {
    console.log("HTML needs to have a div with id root!");
}
