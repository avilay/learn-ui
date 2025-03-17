import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, SafeAreaView, View } from "react-native";
import { Link } from "expo-router";

export default function App() {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        <Text style={styles.title}>Index</Text>
        <Link href="/Books">Go to Books</Link>
        <Link href={{ pathname: "/posts/[title]", params: { title: "hello" } }}>
          Hello
        </Link>
        <Link href="/posts/world">World</Link>
        <StatusBar style="auto" />
      </View>
    </SafeAreaView>
  );
}

// Some random comment
const styles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    justifyContent: "flex-start"
  },
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
