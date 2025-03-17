import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";
import { Link } from "expo-router";

export default function Hello() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Hello</Text>
      <Link href="/">Index</Link>
      <Link href="/world">World</Link>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "aliceblue",
    padding: 20
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  }
});
