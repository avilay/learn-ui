import { StatusBar } from "expo-status-bar";
import { Text, View, StyleSheet } from "react-native";
import { Link } from "expo-router";

export default function Index() {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Index</Text>
      <Link href="/hello">
        <Text>Hello</Text>
      </Link>
      <Link href="/world">
        <Text>World</Text>
      </Link>
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
