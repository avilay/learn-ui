import { Link, Stack } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { useState } from "react";
import { StyleSheet, Text, View } from "react-native";

export default function App() {
  const [title, setTitle] = useState("Namaste");

  return (
    <View style={styles.container}>
      <Stack.Screen
        options={{
          headerTitle: title,
          headerStyle: { backgroundColor: "#f4511e" },
          headerTintColor: "#fff",
          headerTitleStyle: { fontWeight: "bold" }
        }}
      />
      <Text style={styles.para}>
        <Text>Hello, world! No need for a header or a link back to Index</Text>
        <Text>because Stack has already provided it.</Text>
      </Text>
      <Link style={styles.link} href="/world">
        <Text>World</Text>
      </Link>
      <Text
        style={styles.para}
        onPress={() => {
          setTitle("Hello");
        }}
      >
        Press here to update the title.
      </Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "flex-start",
    backgroundColor: "aliceblue",
    padding: 20
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  },
  para: {
    marginTop: 20,
    marginBottom: 10
  },
  link: {
    color: "blue",
    margin: 10
  }
});
