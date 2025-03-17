import { SafeAreaView, Text, StyleSheet, Pressable } from "react-native";
import { StatusBar } from "expo-status-bar";
import { Link } from "expo-router";

export default function Books() {
  return (
    <SafeAreaView style={styles.container}>
      <Text style={styles.title}>Book</Text>
      <Link href="/" asChild>
        <Pressable>
          <Text>Back to Index</Text>
        </Pressable>
      </Link>
      <StatusBar style="auto" />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "antiquewhite",
    justifyContent: "flex-start"
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  }
});
