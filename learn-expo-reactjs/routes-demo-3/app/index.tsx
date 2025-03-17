import { Link, useNavigation } from "expo-router";
import { StatusBar } from "expo-status-bar";
import { useEffect } from "react";
import { StyleSheet, Text, View } from "react-native";

export default function App() {
  const navigation = useNavigation();

  useEffect(() => {
    navigation.setOptions({
      headerStyle: { backgroundColor: "darkgray" },
      headerTintColor: "#fff",
      headerTitleStyle: { fontWeight: "bold" }
    });
  }, [navigation]);

  return (
    <View style={styles.container}>
      <Text>This is the index page.</Text>
      <Link style={styles.link} href="/hello">
        <Text>Hello</Text>
      </Link>

      <Link style={styles.link} href="/aptg">
        <Text>APTG</Text>
      </Link>
      <Link style={styles.link} href="/qr">
        <Text>Quantum Random (qr)</Text>
      </Link>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: "flex-start",
    backgroundColor: "lemonchiffon",
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
