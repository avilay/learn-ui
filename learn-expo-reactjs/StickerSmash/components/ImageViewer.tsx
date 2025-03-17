import { StyleSheet, Image, ImageSourcePropType } from 'react-native';

type ImageViewerProps = {
    placeholder: ImageSourcePropType,
    selected: string
}

export default function ImageViewer({ placeholder, selected }: ImageViewerProps) {
    const imageSource = selected ? { uri: selected } : placeholder;
    return (
        <Image source={imageSource} style={styles.image} />
    );
}

const styles = StyleSheet.create({
    image: {
        width: 320,
        height: 440,
        borderRadius: 18,
    }
})