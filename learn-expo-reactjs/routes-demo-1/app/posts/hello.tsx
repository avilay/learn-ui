import { StatusBar } from "expo-status-bar";
import { StyleSheet, Text, SafeAreaView, View } from "react-native";
import { Link } from "expo-router";

export default function App() {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <View style={styles.container}>
        <Text style={styles.title}>Hello</Text>
        <Link href="/">Back to index</Link>
        {/* wrapping this in Text to get the text layout instead of flex */}
        <Text>
          <Text>
            This is needed because the left swipe on iOS wont pop this page
          </Text>
          <Text>from the nav stack.</Text>
        </Text>
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
    backgroundColor: "lemonchiffon",
    padding: 20
  },
  title: {
    fontSize: 20,
    fontWeight: "bold",
    marginBottom: 50
  }
});
