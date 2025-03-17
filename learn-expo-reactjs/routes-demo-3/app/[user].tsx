import { Link, Stack, useLocalSearchParams } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, View } from "react-native";

export default function User() {
  const { user } = useLocalSearchParams<{ user: string }>();

  return (
    <View style={styles.container}>
      <Stack.Screen options={{ headerTitle: user }} />
      <Text style={styles.title}>Hello {user}</Text>
      <Link style={styles.link} href="/aptg">
        APTG
      </Link>
      <Link style={styles.link} href="/lalji">
        Lalji
      </Link>
      <Link style={styles.link} href="/qr">
        Quantum Random (qr)
      </Link>
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
  link: {
    color: "blue",
    margin: 10
  }
});
