import { Link } from "expo-router";
import { Text, View } from "react-native";

export default function ChatsIndex() {
  return (
    <View>
      <Text>ChatsIndex</Text>
      <Link href="/chats/show">Show</Link>
    </View>
  );
}
