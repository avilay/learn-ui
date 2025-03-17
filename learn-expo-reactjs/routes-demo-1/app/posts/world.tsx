import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, SafeAreaView, View } from "react-native";
import { Link } from "expo-router";

export default function App() {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        <Text style={styles.title}>World</Text>
        <Link href="/">Back to index</Link>
        <StatusBar style="auto" />
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    justifyContent: "flex-start"
  },
  container: {
    flex: 1,
    backgroundColor: "lavenderblush",
    padding: 20
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  }
});
