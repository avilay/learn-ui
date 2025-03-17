import React, { useState } from "react";
import { View, TouchableOpacity, Text, StyleSheet } from "react-native";
import type { PropsWithChildren } from "react";

/*
Expo will automatically set the height of the html, body, and root container to
100%. It seems that width is automatically set to 100% without anything explicitly
setting it. Having both height and width to 100% makes the container take up the
full size of the window. This makes the flexbox column layout work very well.

In normal CSS I'd set the container's display style to flex, `display: flex;`.
But that will not work here because display is not a valid style. Instead Expo
or ReactNative will automatically set the display: flex; attribute on the root
div element, as well as all the <View> elements. The only difference between the
root element and the View elements is that flex-direction is left to its default
value on root (row) whereas it is explicity set to column on the View elements.

If I set the `flex: 1` attribute
what I am really doing in normal CSS terms is setting `flex: 1 1 0%`, i.e., the
element should fill up all the space along the primary axis.
*/

export default function App() {
  return (
    <View style={styles.container}>
      <View style={[styles.box, { backgroundColor: "powderblue" }]} />
      <View style={[styles.box, { backgroundColor: "skyblue" }]} />
      <View style={[styles.box, { backgroundColor: "steelblue" }]} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "aliceblue",
    justifyContent: "space-evenly",
    margin: 10,
  },
  box: {
    width: 50,
    height: 50,
  },
});
