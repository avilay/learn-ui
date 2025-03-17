import { Slot } from "expo-router";
import { SafeAreaView, StyleSheet } from "react-native";

export default function RootLayout() {
  return (
    <SafeAreaView style={styles.safeContainer}>
      <Slot />
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeContainer: {
    flex: 1,
    justifyContent: "flex-start"
  }
});
