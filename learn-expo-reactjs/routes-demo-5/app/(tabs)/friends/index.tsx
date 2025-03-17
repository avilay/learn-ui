import { Link } from "expo-router";
import { Text, View } from "react-native";

export default function FriendsIndex() {
  return (
    <View>
      <Text>FriendsIndex</Text>
      <Link href="/friends/show">Show</Link>
    </View>
  );
}
