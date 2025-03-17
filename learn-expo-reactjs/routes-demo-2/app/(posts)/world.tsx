import { StatusBar } from "expo-status-bar";
import { Text, View, StyleSheet } from "react-native";
import { Link } from "expo-router";

export default function World() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>World</Text>
      <Link href="/">Index</Link>
      <Link href="/hello">Hello</Link>
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
